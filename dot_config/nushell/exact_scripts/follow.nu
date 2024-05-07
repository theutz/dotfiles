# Follow log files for various user services
export def follow [] {
  $"follow logs for various services"
}

# Follow logs for the yabai window manager
export def "follow yabai" [] {
  ^lnav $"/tmp/yabai_(whoami).err.log" $"/tmp/yabai_(whoami).out.log"
}

# Follow logs for the skhd hotkey daemon
export def "follow skhd" [] {
  ^lnav $"/tmp/skhd_(whoami).err.log" $"/tmp/skhd_(whoami).out.log"
}
