export def east [] {
  try {
    yabai -m window --focus east
  } catch {
    yabai -m display --focus east
  }
}

export def south [] {
  yabai -m window --focus south
}

export def north [] {
  yabai -m window --focus north
}

export def west [] {
    try {
      yabai -m window --focus west
    } catch {
      yabai -m display --focus west
    }
  }
