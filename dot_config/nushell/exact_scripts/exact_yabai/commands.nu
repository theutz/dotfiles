use completions.nu *
use xdg ["xdg config"]

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

