export def west [] {
  try {
    yabai -m window --swap west
  } catch {
    let id = (yabai -m query --windows --window | from json
      | get id)
    yabai -m window --display west
    yabai -m window --focus $id
  }
}

export def south [] {
  yabai -m window --swap south
}

export def north [] {
  yabai -m window --swap north
}

export def east [] {
  try {
    yabai -m window --swap east
  } catch {
    let id = (yabai -m query --windows --window | from json
      | get id)
    yabai -m window --display east
    yabai -m window --focus $id
  }
}

export def next [] {
  yabai -m window --swap next
}

export def prev [] {
  yabai -m window --swap prev
}
