export def get-zoom-state [] {
  (yabai -m query --windows --window | from json
    | if ($in.has-fullscreen-zoom) { 'fullscreen' } else
      if ($in.has-parent-zoom) { 'parent' } else
      {'none'}
    | tee { print $"Current zoom: ($in)" }
    | first)
}

def fullscreen [] {
  (yabai -m query --windows --window | from json |
    | if ($in.has-fullscreen-zoom) { return } else {
        toggle-fullscreen
      })
}

def parent [] {
  (yabai -m query --windows --window | from json
    | if $in.has-parent-zoom {
        if $in.has-fullscreen-zoom {
          toggle-fullscreen
        }
      } else {
        toggle-parent
      })
}

def unzoom [] {
  (yabai -m query --windows --window | from json
    | if ($in.has-parent-zoom) { toggle-parent } else
      if ($in.has-fullscreen-zoom) { toggle-fullscreen })
}

export def increase [] {
  match (get-zoom-state) {
    fullscreen => { print "Maximum zoom reached." },
    parent => fullscreen,
    none => parent
  }
}

export def decrease [] {
  match (get-zoom-state) {
    fullscreen => parent,
    parent => unzoom,
    none => { print "Minimum zoom reached." }
  }
}

export def cycle [] {
  match (get-zoom-state) {
    fullscreen => unzoom,
    parent => fullscreen,
    none => parent
  }
}

export def toggle-fullscreen [] {
  yabai -m window --toggle zoom-fullscreen
}

export def toggle-parent [] {
  yabai -m window --toggle zoom-parent
}
