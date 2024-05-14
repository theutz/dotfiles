use xdg ["xdg config"]

export def "config yabai" [
  --nushell-config (-n) # configure nushell module
] {
  let path = if $nushell_config {
    [$nu.default-config-dir scripts yabai mod.nu]
  } else {
    [(xdg config) yabai yabairc]
  } | path join

  run-external $env.EDITOR $path
}

# Follow logs for the yabai window manager
export def "follow yabai" [] {
  ^lnav $"/tmp/yabai_(whoami).err.log" $"/tmp/yabai_(whoami).out.log"
}

# Follow logs for the skhd hotkey daemon
export def "follow skhd" [] {
  ^lnav $"/tmp/skhd_(whoami).err.log" $"/tmp/skhd_(whoami).out.log"
}
