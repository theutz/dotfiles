def get-curr-win [] {
  yabai -m query --windows --window | from json | get id
}

def with-focus [action: closure] {
  let win = (get-curr-win)
  do $action
  yabai -m window --focus $win
}

export def next [] {
  with-focus { yabai -m window --space next }
}

export def prev [] {
  with-focus { yabai -m window --space prev }
}

export def main [selector: string] {
  with-focus { yabai -m window --space $selector }
}
