def current-win-id [] {
  yabai -m query --windows --window | from json | get id
}

export def next [] {
  yabai -m window next --stack (current-win-id)
}

export def prev [] {
  yabai -m window prev --stack (current-win-id)
}

export def pop [] {
  for x in 1..2 {
    yabai -m window --toggle float
  }
}
