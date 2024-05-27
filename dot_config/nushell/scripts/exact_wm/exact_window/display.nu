def with-focus [action: closure] {
  let win = yabai -m query --windows --window | from json | get id
  do $action
  sleep 0.2sec
  yabai -m window --focus $win
}

export def next [] {
  with-focus { yabai -m window --display next }
}

export def prev [] {
  with-focus { yabai -m window --display prev }
}

export def cycle [] {
  with-focus {
    yabai -m window --display next
      | complete
      | if $in.exit_code > 0 {
          yabai -m window --display first
        }
  }
}
