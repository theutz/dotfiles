use pueue

# Start background service
export def start [] {
  pueue service start sketchybar sketchybar
}

# Stop background service
export def stop [] {
  pueue service stop sketchybar
}

# Restart background service
export def restart [] {
  pueue service restart sketchybar
}

# Get the background service status
export def status [] {
  pueue service status sketchybar
}
