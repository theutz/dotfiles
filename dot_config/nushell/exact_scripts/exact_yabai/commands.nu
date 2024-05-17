use completions.nu *
use xdg *

# Start the yabai window manager daemon
export def start [] {
  let group = get-group
  pueue add -g $group -- yabai
  sudo yabai --load-sa
}

# Restart the yabai window manager daemon
export def restart [] {
  start
  running-task | if ($in | is-not-empty) { pueue kill $in }
}

# Report the status of the yabai daemon
export def status [] {
  pueue status -g (get-group)
}

# Edit the yabai nushell module
export def "edit nu" [] {
  run-external $env.EDITOR ($nu.default-config-dir
    | path join scripts yabai)
}

# Edit the yabai configuration files
export def edit [] {
  run-external $env.EDITOR (xdg config yabai yabairc)
  restart
}

# Print the logs for the yabai daemon
export def log [
  --follow(-f) # Follow the logs
] {
  let id = running-task
  pueue log $id
  if $follow { pueue follow $id }
}

export def follow [] {
  log -f
}

def running-task [] {
  (pueue status -g yabai --json | from json
    | get tasks | transpose | flatten 
    | where status == Running | get -i id.0)
}

def get-group [] {
  let name = "yabai"
  let group_exists = $name in (pueue status --json | from json
    | get groups | transpose group | get group)
  if not $group_exists { pueue group add $name }
  $name
}
