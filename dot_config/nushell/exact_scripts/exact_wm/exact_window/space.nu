export def next [] {
  let win = (yabai -m query --windows --window | from json)
  yabai -m window --space next
  yabai -m window --focus $win.id
}

export def prev [] {
  let win = (yabai -m query --windows --window | from json)
  yabai -m window --space prev
  yabai -m window --focus $win.id
}
