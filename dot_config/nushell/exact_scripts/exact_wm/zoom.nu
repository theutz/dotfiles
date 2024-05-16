export def get-zoom-state [] {
  (yabai -m query --windows --window | from json
    | if ($in.has-fullscreen-zoom) { 'fullscreen' } else
      if ($in.has-parent-zoom) { 'parent' } else
      {'none'}
    | tee { print $"Current zoom: ($in)" }
    | first)
}

def zoom-to-fullscreen [] {
  (yabai -m query --windows --window | from json |
    | if ($in.has-fullscreen-zoom) { return } else {
        yabai -m window --toggle zoom-fullscreen
      })
}

def zoom-to-parent [] {
  (yabai -m query --windows --window | from json
    | if $in.has-parent-zoom {
        if $in.has-fullscreen-zoom {
          yabai -m window --toggle zoom-fullscreen
        }
      } else {
        yabai -m window --toggle zoom-parent
      })
}

def unzoom [] {
  (yabai -m query --windows --window | from json
    | if ($in.has-parent-zoom) { yabai -m window --toggle zoom-parent } else
      if ($in.has-fullscreen-zoom) { yabai -m window --toggle zoom-fullscreen })
}

export def increase [] {
  match (get-zoom-state) {
    fullscreen => { print "Maximum zoom reached." },
    parent => zoom-to-fullscreen,
    none => zoom-to-parent
  }
}

export def decrease [] {
  match (get-zoom-state) {
    fullscreen => zoom-to-parent,
    parent => unzoom,
    none => { print "Minimum zoom reached" }
  }
}
