use xdg *
use pueue

# Start the skhd daemon
export def start [] {
  pueue service start skhd skhd
}

# Stop the skhd daemon
export def stop [
  --clean (-c) # Clean up stopped commands
] {
  pueue service stop skhd --clean=$clean
}

# Restart the skhd daemon
export def restart [] {
  pueue service restart skhd
}

# Get the queue status for the skhd daemon
export def status [] {
  pueue service status skhd
}
