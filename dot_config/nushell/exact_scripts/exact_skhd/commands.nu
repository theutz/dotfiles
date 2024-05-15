use xdg *

# Start the skhd daemon
export def "skhd start" [] {
  let groups = (pueue status --json | from json | get groups | transpose group | get group)
  if ("skhd" not-in $groups) { pueue group add skhd }
  pueue add -g skhd -- skhd
  pueue status -g skhd
}

# Restart the skhd daemon
export def "skhd restart" [] {
  skhd start
  let id = (pueue status -g skhd --json | from json
    | get tasks | transpose | flatten
    | where status == Running
    | get id.0)
  pueue kill $id
}

# Get the queue status for the skhd daemon
export def "skhd status" [] {
  pueue status -g skhd
}

# Follow logs for the skhd hotkey daemon
export def "skhd log" [
  --follow(-f) # Follow the log
] {
  let id = (pueue status -g skhd --json
  | from json
  | get tasks
  | values
  | where status == Running
  | get id.0)
  pueue log $id
  if $follow { pueue follow $id }
}

# Edit the skhd configuration files
export def "skhd edit config" [] {
  run-external $env.EDITOR (xdg config skhd)
}

# Edit the skhd nu module
export def "skhd edit nu" [] {
  run-external $env.EDITOR ($nu.default-config-dir
    | path join scripts skhd)
}
