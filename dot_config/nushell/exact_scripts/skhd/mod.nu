use xdg ["xdg config"]

def "nu-complete config skhd targets" [] {
  [ [value description];
    [rc-file (xdg config skhd skhdrc)]
    [nu-module ($nu.default-config-dir | path join scripts skhd mod.nu)]
    [launch-agent ($env.HOME | path join Library LaunchAgents com.koekeishiya.skhd.plist)]
  ]
}

export def "config skhd" [
  target?: string@"nu-complete config skhd targets"
] {
  let path = (
    nu-complete config skhd targets
    | where value == ($target | default "rc-file")
    | get description.0
  )
  
  run-external $env.EDITOR $path
}

# Follow logs for the skhd hotkey daemon
export def "follow skhd" [] {
  ^lnav $"/tmp/skhd_(whoami).err.log" $"/tmp/skhd_(whoami).out.log"
}
