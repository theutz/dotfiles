use completions.nu *
use xdg *
use pueue

# Start the yabai daemon
export def start [] {
  pueue service start yabai yabai
}

# Stop the yabai daemon
export def stop [--clean (-c)] {
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
