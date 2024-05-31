# [[file:../nushell.org::*Main][Main:1]]
export def main [] {
    "Commands for interacting with long-running services."
}
# Main:1 ends here

# [[file:../nushell.org::*Main][Main:2]]
def service-definitions [] {
    [
      [name        type  command];
      [yabai       pueue null]
      [skhd        pueue null]
      [borders     pueue null]
      [sketchybar  pueue null]
      [dark-notify pueue 'dark-notify -c "tmux source-file ~/.config/tmux/tmux.conf"']
    ]
}
# Main:2 ends here

# [[file:../nushell.org::*Main][Main:3]]
def service-names [] {
  service-definitions | get name
}

def service-command [service: string@service-names] {
  service-definitions | where name == $service | get command.0
}
# Main:3 ends here

# [[file:../nushell.org::*Start][Start:1]]
def start-with-pueue [
    group: string, # The name of the group
    command?: string # The command to pass, else just use the group name
] {
    use pueue.nu

    pueue status | get groups | where name == $group
    | if ($in | is-empty) {
        ^pueue groups add $group
    }

    pueue status | get tasks.details | where group == $group
    | if ($in | is-empty) {
        with-env { SHELL: nu-login } {
            ^pueue add --group $group --working-directory ~ -- ($command | default $group)
        }
        ^pueue start --group $group
        } else {
            pueue status | get tasks.details
                | where group == $group
                | each { ^pueue kill $in.id }
            pueue clean --group $group
            start-with-pueue $group $command
        }
}
# Start:1 ends here

# [[file:../nushell.org::*Start][Start:2]]
# Start a service
export def start [
    service: string@service-names, # The name of the service
] {
    start-with-pueue $service (service-command $service)
}
# Start:2 ends here

# [[file:../nushell.org::*Status][Status:1]]
def status-with-pueue [] {
  use pueue.nu

  pueue status | get tasks.details | select group status command
    | rename -c { group: service }
    | upsert status {
        match ($in | describe -d | get type) {
          record => ($in | items {|k,v| $"($k): ($v)"} | first),
          _ => $in
        }
    }
}
# Status:1 ends here

# [[file:../nushell.org::*Status][Status:2]]
# Get the status of a running service
export def status [
    service?: string@service-names
    --verbose (-v) # Show extra output
] {
    status-with-pueue | if $verbose { $in } else { $in | reject command }
    | if ($service | is-not-empty) {
      $in | where service == $service
    } else { $in }
}
# Status:2 ends here

# [[file:../nushell.org::*Stop][Stop:1]]
def stop-with-pueue [group: string] {
  use pueue.nu

  pueue status | get tasks.details | where group == $group
  | each { pueue kill $in.id }

  pueue clean -g $group
}
# Stop:1 ends here

# [[file:../nushell.org::*Stop][Stop:2]]
# Stop a service
export def stop [
    service: string@service-names, # The name of the service
] {
    stop-with-pueue $service
}
# Stop:2 ends here

# [[file:../nushell.org::*Helper function for pueue][Helper function for pueue:1]]
def logs-with-pueue [
    group: string
    --follow (-f)
] {
    ^pueue status --json | from json | get tasks | values
        | where group == $group and status == Running
        | get id.0
        | do {|x|
            pueue log $x
            if ($follow) {
                pueue follow $x
            }
        } $in
}
# Helper function for pueue:1 ends here

# [[file:../nushell.org::*Public facing command][Public facing command:1]]
# View the logs for a running process
export def logs [
    service: string@service-names
    --follow (-f) # Follow logs after the initial dump
] {
    logs-with-pueue $service --follow=$follow
}
# Public facing command:1 ends here

# [[file:../nushell.org::*Restart][Restart:1]]
def restart-with-pueue [group: string] {
  stop-with-pueue $group
  start-with-pueue $group (service-command $group)
}
# Restart:1 ends here

# [[file:../nushell.org::*Restart][Restart:2]]
# Restart a service
export def restart [
  service: string@service-names, # The name of the service
] {
  restart-with-pueue $service
}
# Restart:2 ends here
