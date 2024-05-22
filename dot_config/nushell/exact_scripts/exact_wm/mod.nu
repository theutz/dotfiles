export use mode.nu
export use window
export use space
export use display

export def reload [] {
  yabai --restart-service
}

# Commands for working with the window manager
export def main [] {
  help wm
}
