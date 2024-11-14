use pueue.nu

export def main [] {
    pueue status | get tasks.details | select id command group status | where status == Running
}

def service-definitions [] {
    [
      [name        type  command];
      [yabai       pueue null]
      [skhd        pueue null]
      [borders     pueue null]
      [sketchybar  pueue null]
      [dark-notify pueue 'dark-notify -c "nu ~/.config/dark-notify/on-change.nu"']
      [qutebrowser pueue 'qutebrowser --nowindow']
      [emacs       pueue 'emacs --fg-daemon']
    ]
}

def service-names [] {
  service-definitions | get name
}

def service-command [service: string@service-names] {
  service-definitions | where name == $service | get command.0
}

def start-with-pueue [
    group: string, # The name of the group
    command?: string # The command to pass, else just use the group name
] {
    use pueue.nu

    pueue status | get groups | where name == $group
    | if ($in | is-empty) {
        ^pueue group add $group
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

# Start a service
export def start [
    service?: string@service-names, # The name of the service
] {
    if ($service | is-empty) {
      service-names | each {|x| start $x }
    }
    start-with-pueue $service (service-command $service)
}

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

def stop-with-pueue [group: string] {
  use pueue.nu

  pueue status | get tasks.details | where group == $group
  | each { pueue kill $in.id }

  pueue clean -g $group
}

# Stop a service
export def stop [
    service?: string@service-names, # The name of the service
] {
    if ($service | is-empty) {
      service-names | each {|x| stop $x }
    }
    stop-with-pueue $service
}

def log-with-pueue [
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

# View the logs for a running process
export def log [
    service: string@service-names
    --follow (-f) # Follow logs after the initial dump
] {
    log-with-pueue $service --follow=$follow
}

export def restart [
  service: string@service-names, # The name of the service
] {
  start-with-pueue $service
}
