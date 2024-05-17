export use edit.nu
export use mode.nu
export use window
export use space
use yabai

export def reload [] {
  yabai restart
}

# Commands for working with the window manager
export def main [] {
  help wm
}

# Edit nu commands related to the window manager
export def edit [] {
  run-external $env.EDITOR ($nu.default-config-dir | path join scripts wm)
}
