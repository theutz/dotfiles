# Simple hotkey daemon
export extern skhd [
  --install-service   # Install launchd service file into ~/Library/LaunchAgents/com.koekeishiya.skhd.plist
  --uninstall-service # Remove launchd service file ~/Library/LaunchAgents/com.koekeishiya.skhd.plist
  --start-service     # Run skhd as a service through launchd
  --restart-service   # Restart skhd service
  --stop-service      # Stop skhd service from running
  --verbose(-V)       # Output debug information
  --profile(-P)       # Output profiling information  
  --version(-v)       # Print version number to stdout  
  --config(-c)        # Specify location of config file  
  --observe(-o)       # Output keycode and modifiers of event. Ctrl+C to quit
  --reload(-r)        # Signal a running instance of skhd to reload its config file
  --no-hotload(-h)    # Disable system for hotloading config file
  --key(-k)           # Synthesize a keypress (same syntax as when defining a hotkey)
  --text(-t)          # Synthesize a line of text
]
