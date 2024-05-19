use completions.nu *
use xdg *

# Start the yabai window manager daemon
export def start [] {
  let group = get-group
  pueue add -g $group -- yabai
  pueue start -g $group
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

# Kill the pueue group
export def kill [
  --clean (-c) # Clean up logs
] {
  pueue kill -g yabai
  if ($clean) {
    pueue clean -g yabai
    (pueue status -g yabai --json | from json
      | get tasks | values | get id
      | each {|x| pueue remove $x})
  }
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
