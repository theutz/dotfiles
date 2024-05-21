use xdg.nu

# Start borders background service
export def start [] {
  try { ^pueue group add borders }
  ^pueue add -g borders -- (xdg config borders bordersrc)
  ^pueue start -g borders
}

# Restart borders background service
export def restart [] {
  try { stop }
  start
}

# Stop borders background service
export def stop [
  --cleanup (-c)
] {
  ^pueue kill -g borders
  if ($cleanup) {
    ^pueue clean -g borders
  }
}

# Show pueue status for borders
export def status [] {
  ^pueue status -g borders
}
