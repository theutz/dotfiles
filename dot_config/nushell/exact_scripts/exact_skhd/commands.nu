use xdg *
use pueue

# Start the skhd daemon
export def start [] {
  #let groups = (pueue status --json | from json
  #  | get groups | transpose group | get group)
  #if ("skhd" not-in $groups) { pueue group add skhd }
  #SHELL="nu-login" pueue add -g skhd -- skhd
  pueue service start skhd skhd
}

# Stop the skhd daemon
export def stop [] {
  pueue service stop skhd
}

# Restart the skhd daemon
export def restart [] {
  pueue service restart skhd
  #start
  #let id = (pueue status -g skhd --json | from json
  #  | get tasks | transpose | flatten
  #  | where status == Running | get -i  id.0)
  #if ($id | is-not-empty) {
  #  pueue kill $id
  #}
}

# Get the queue status for the skhd daemon
export def status [] {
  pueue service status skhd
}
