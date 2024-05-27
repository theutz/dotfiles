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

