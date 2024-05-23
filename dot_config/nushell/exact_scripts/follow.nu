export def sketchybar [] {
  lnav ...(glob /opt/homebrew/var/log/sketchybar/sketchybar.*.log)
}

export def skhd [] {
  lnav ...(glob /tmp/skhd*.{out,err}.log)
}

export def yabai [] {
  lnav ...(glob /tmp/yabai*.{out,err}.log)
}

export def borders [] {
  lnav ...(glob /opt/homebrew/var/log/borders/borders.{err,out}.log)
}

export def main [] {
  help follow
}
