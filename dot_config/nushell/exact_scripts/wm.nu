# [[file:../nushell.org::*space][space:1]]
export module space {
    export def equalize [] {
        yabai -m space --equalize
    }

    export def balance [] {
        yabai -m space --balance
    }

    export def create [] {
        yabai -m space --create
    }

    export def destroy [] {
        let id = (yabai -m query --displays --display | from json
            | get spaces | last)
        yabai -m space --destroy $id
    }

    export def flip-x [] {
        yabai -m space --mirror x-axis
    }

    export def flip-y [] {
        yabai -m space --mirror y-axis
    }

    export def flip-xy [] {
        flip-x
        flip-y
    }

    export module focus {
        export def main [selector: string] {
            yabai -m space --focus $selector
        }

        export def next [] {
            yabai -m space --focus next
            sleep 0.2sec
            yabai -m window --focus first
        }

        export def prev [] {
            yabai -m space --focus prev
            sleep 0.2sec
            yabai -m window --focus first
        }
    }

    export module rotate {
        export def cw [] {
            yabai -m space --rotate 270
        }

        export def ccw [] {
            yabai -m space --rotate 90
        }

        export def main [] {
            ccw
        }
    }
}
# space:1 ends here

# [[file:../nushell.org::*window][window:1]]
export module window {
# window:1 ends here

# [[file:../nushell.org::*window][window:2]]
  export module size {
    export def "ratio increase" [] {
      yabai -m window --ratio rel:0.05
    }

    export def "ratio decrease" [] {
      yabai -m window --ratio rel:-0.05
    }
  }
# window:2 ends here

# [[file:../nushell.org::*window][window:3]]
  export module focus {
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
      (try { yabai -m window --focus stack.next }
        catch { yabai -m window --focus stack.first })
    }

    export def "stack prev" [] {
      (try { yabai -m window --focus stack.prev }
        catch { yabai -m window --focus stack.last })
    }
  }
# window:3 ends here

# [[file:../nushell.org::*window][window:4]]
  export module swap {
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
  }
# window:4 ends here

# [[file:../nushell.org::*window][window:5]]
  export module warp {
    export def west [] {
      yabai -m window --warp west
    }

    export def south [] {
      yabai -m window --warp south
    }

    export def north [] {
      yabai -m window --warp north
    }

    export def east [] {
      yabai -m window --warp east
    }
  }
# window:5 ends here

# [[file:../nushell.org::*window][window:6]]
  export module zoom {
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

  }
# window:6 ends here

# [[file:../nushell.org::*window][window:7]]
  export module space {
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
  }
# window:7 ends here

# [[file:../nushell.org::*window][window:8]]
  export module stack {
    def current-win-id [] -> string {
      yabai -m query --windows --window | from json | get id
    }

    def is-stacked [] -> bool {
      yabai -m query --windows --window | from json | get stack-index | $in > 0
    }

    export def next [] {
      if (is-stacked) {
        yabai -m window --stack next
      } else {
        yabai -m window next --stack (current-win-id)
      }
    }

    export def prev [] {
      if (is-stacked) {
        yabai -m window --stack prev
      } else {
        yabai -m window prev --stack (current-win-id)
      }
    }

    export def pop [] {
      for x in 1..2 {
        yabai -m window --toggle float
      }
      balance
    }
  }
# window:8 ends here

# [[file:../nushell.org::*window][window:9]]
  export module toggle {
    export def split [] {
      yabai -m window --toggle split
    }
  }
# window:9 ends here

# [[file:../nushell.org::*window][window:10]]
  export module display {
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
  }
# window:10 ends here

# [[file:../nushell.org::*window][window:11]]
}
# window:11 ends here

# [[file:../nushell.org::*display][display:1]]
export module display {
# display:1 ends here

# [[file:../nushell.org::*display][display:2]]
  export module focus {
    export def next [--cycle (-c)] {
      yabai -m display --focus next
        | complete
        | if $cycle and $in.exit_code > 0 {
            yabai -m display --focus first
          }
    }

    export def prev [--cycle (-c)] {
      yabai -m display --focus prev
        | complete
        | if $cycle and $in.exit_code > 0 {
            yabai -m display --focus last
          }
    }
  }
# display:2 ends here

# [[file:../nushell.org::*display][display:3]]
}
# display:3 ends here
