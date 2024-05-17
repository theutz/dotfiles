use xdg.nu

export def edit [] {
  enter (xdg config sketchybar)
  ^$env.EDITOR sketchybarrc
  n
}
