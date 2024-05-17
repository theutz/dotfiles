use xdg.nu

export def edit [] {
  enter (xdg config sketchybar)
  try {
    ^$env.EDITOR sketchybarrc
    brew services restart sketchybar
  }
  n
}

export def "edit nu" [] {
  enter ($nu.default-config-dir | path join scripts)
  ^$env.EDITOR sketchybar.nu
  n
}
