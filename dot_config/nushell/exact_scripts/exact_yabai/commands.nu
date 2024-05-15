use completions.nu *
use xdg *

# Follow logs for the yabai window manager
export def "follow yabai" [] {
  let id = (pueue status -g yabai --json
    | from json
    | get tasks
    | values
    | where status == Running
    | get id.0)
  pueue follow $id
}

# Start the yabai window manager daemon
export def "yabai start" [] {
  let group = get-group
  pueue add -g $group -- yabai
  sudo yabai --load-sa
}

# Restart the yabai window manager daemon
export def "yabai restart" [] {
  yabai start
  let id = running-task
  pueue kill $id
}

# Report the status of the yabai daemon
export def "yabai status" [] {
  pueue status -g (get-group)
}

# Edit the yabai nushell module
export def "yabai edit nu" [] {
  run-external $env.EDITOR ($nu.default-config-dir
    | path join scripts yabai)
}

# Edit the yabai configuration files
export def "yabai edit config" [] {
  run-external $env.EDITOR (xdg config yabai)
}

# Print the logs for the yabai daemon
export def "yabai log" [
  --follow(-f) # Follow the logs
] {
  let id = running-task
  pueue log $id
  if $follow { pueue follow $id}
}

def running-task [] {
  (pueue status -g yabai --json | from json
    | get tasks | transpose | flatten 
    | where status == Running | get id.0)
}

def get-group [] {
  let name = "yabai"
  let group_exists = $name in (pueue status --json | from json
    | get groups | transpose group | get group)
  if not $group_exists { pueue group add $name }
  $name
}
