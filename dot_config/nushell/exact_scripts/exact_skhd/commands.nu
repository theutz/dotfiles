use xdg *

# Start the skhd daemon
export def start [] {
  let groups = (pueue status --json | from json | get groups | transpose group | get group)
  if ("skhd" not-in $groups) { pueue group add skhd }
  SHELL="nu-login" pueue add -g skhd -- skhd
}

# Restart the skhd daemon
export def restart [] {
  start
  let id = (pueue status -g skhd --json | from json
    | get tasks | transpose | flatten
    | where status == Running
    | get -i  id.0)
  if ($id | is-not-empty) {
    pueue kill $id
  }
}

# Get the queue status for the skhd daemon
export def status [] {
  pueue status -g skhd
}

# Print (or follow) logs for the skhd hotkey daemon
export def log [
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

# Follow the skhd logs
export def follow [] {
  log -f
}
