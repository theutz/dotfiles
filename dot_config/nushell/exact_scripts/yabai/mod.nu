use xdg ["xdg config"]

def "nu-complete config yabai targets" [] {
    [ [value description];
      [rc-file (xdg config yabai yabairc)]
      [nu-module ($nu.default-config-dir | path join scripts yabai mod.nu)]
      [launch-agent ($env.HOME | path join Library LaunchAgents com.koekeishiya.yabai.plist)]
    ]
  }

def "nu-complete yabai message" [context: string] {
  [config]
}

# Control the yabai window manager
export extern main [
  --load-sa                 # Install and load the scripting-addition.
  --uninstall-sa            # Uninstall the scripting-addition.
  --install-service         # Write launchd service file to disk.
  --uninstall-service       # Remove launchd service file from disk.
  --start-service           # Enable, load, and start the launchd service.
  --restart-service         # Attempts to restart the service instance.
  --stop-service            # Stops a running instance of the service.
  --message(-m): string@"nu-complete yabai message" # Send message to a running instance of yabai.
  --config(-c): string # Use the specified configuration file.
  --verbose(-V)             # Output debug information to stdout.
  --version(-v)             # Print version to stdout and exit.
  --help(-h)                # Print options to stdout and exit.
]

export def "config yabai" [
  target?: string@"nu-complete config yabai targets"
] {
  let path = (
    nu-complete config yabai targets
    | where value == ($target | default "rc-file")
    | get description.0
  )

  run-external $env.EDITOR $path
}

# Follow logs for the yabai window manager
export def "follow yabai" [] {
  ^lnav $"/tmp/yabai_(whoami).err.log" $"/tmp/yabai_(whoami).out.log"
}

