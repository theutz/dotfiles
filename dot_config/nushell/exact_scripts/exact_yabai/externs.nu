use completions.nu *

# Control the yabai window manager
export extern yabai [
  --load-sa                                 # Install and load the scripting-addition.
  --uninstall-sa                            # Uninstall the scripting-addition.
  --install-service                         # Write launchd service file to disk.
  --uninstall-service                       # Remove launchd service file from disk.
  --start-service                           # Enable, load, and start the launchd service.
  --restart-service                         # Attempts to restart the service instance.
  --stop-service                            # Stops a running instance of the service.
  --config(-c):  string                     # Use the specified configuration file.
  --verbose(-V)                             # Output debug information to stdout.
  --version(-v)                             # Print version to stdout and exit.
  --help(-h)                                # Print options to stdout and exit.
  --message(-m): string@"nu-complete yabai" # Send message to a running instance of yabai.
  ...args:       string@"nu-complete yabai"    # Arguments to control yabai
]
