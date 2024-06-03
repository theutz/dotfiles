# [[file:../../nushell.org::*root][root:2]]
export use mode.nu

# Commands for working with the window manager
export def main [] {
  help wm
}

# Restart the window manager
export def restart [] {
  use service.nu
  service restart yabai
}
# root:2 ends here
