export use edit.nu
export use focus
export use mode.nu
export use zoom.nu
use yabai

export def reload [] {
  yabai restart
}

# Commands for working with the window manager
export def main [] {
  help wm
}
