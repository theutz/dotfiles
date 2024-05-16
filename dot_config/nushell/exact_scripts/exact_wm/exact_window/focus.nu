export def east [] {
  try { yabai -m window --focus east } catch { yabai -m display --focus east }
}

export def south [] {
  yabai -m window --focus south
}

export def north [] {
  yabai -m window --focus north
}

export def west [] {
  try { yabai -m window --focus west } catch { yabai -m display --focus west }
}

export def next [] {
  try {
    yabai -m window --focus next
  } catch {
    try {
      yabai -m display --focus next
      yabai -m window --focus first
    } catch {
      yabai -m display --focus first
      yabai -m window --focus first
    }
  }
}

export def prev [] {
  try {
    yabai -m window --focus prev
  } catch {
    try {
      (yabai -m query --spaces --display prev | from json
        | where is-visible == true | first
        | yabai -m query --spaces --space $in.index | from json
        | get last-window
        | yabai -m window --focus $in)
    } catch {
      (yabai -m query --spaces --display last | from json
        | where is-visible == true | get 0.index
        | yabai -m query --spaces --space $in | from json
        | get last-window
        | yabai -m window --focus $in)
    }
  }
}

export def "stack next" [] {
  yabai -m window --focus stack.next
}

export def "stack prev" [] {
  yabai -m window --focus stack.prev
}
