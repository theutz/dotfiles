use completions.nu *
use xdg ["xdg config"]
source commands.nu

# Follow logs for the yabai window manager
export def "follow yabai" [] {
  let id = (pueue status -g yabai --json
    | from json
    | get tasks
    | values
    | where status == Running
    | get id.0)
  pueue follow $id
}

# Configure the yabai window manager
export def "config yabai" [
  target: string@"nu-complete config yabai targets"
] {
  let path = (
    nu-complete config yabai targets
    | where value == $target
    | get description.0
  )

  run-external $env.EDITOR $path
}

# Start the yabai window manager daemon
export def "yabai start" [] {
  ^pueue add -g yabai -- yabai
  sudo yabai --load-sa
}

# Restart the yabai window manager daemon
export def "yabai restart" [] {
  ^pueue kill -g yabai
  sleep 1sec
  yabai start
}
