use xdg.nu

export module service {
  # Start running the service
  export def start [name: string, action: string] {
    pueue status --json | from json
      | get groups | transpose group | get group
      | if ($name not-in $in) { pueue group add $name }
    with-env { SHELL: "nu-login" } {
      pueue add -g $name -- $action
    }
    pueue clean -g $name
    pueue start -g $name
  }

  # Stop the service
  export def stop [
    name: string,
    --clean (-c) # Clean up failed commands
  ] {
    pueue kill -g $name
    if ($clean) { pueue clean -g $name }
  }

  # Restart the service
  export def restart [name: string] {
    stop $name
    sleep 0.2sec
    pueue restart -g $name
    pueue clean -g $name
    pueue start -g $name
  }

  # Get service status
  export def status [name: string] {
    pueue status -g $name
  } 
}
