use completions.nu *
use follow.nu
use edit.nu
use xdg *
use pueue

# Start the yabai daemon
export def start [] {
  pueue service start yabai yabai
}

# Stop the yabai daemon
export def stop [
  --clean (-c) # Clean pueue queue
] {
  pueue service stop yabai --clean=$clean
}

# Restart the yabai window manager daemon
export def restart [] {
  pueue service restart yabai
}

# Report the status of the yabai daemon
export def status [] {
  pueue service status yabai
}

# Follow the logs for yabai
export def follow [] {
  follow yabai
}

# Edit yabai configs
export def edit [
  --nushell (-n) # Edit nushell commands
] {
  edit yabai --nushell=$nushell
  if not $nushell {
    (restart)
  }
}
