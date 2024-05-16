use rose-pine

export def default [] {
  print "DEFAULT mode"
  (
    borders
    $"active_color=(rose-pine dark gold)"
    $"inactive_color=(rose-pine dark base argb 88)"
    style=round
    width=8
  )
}

export def win [] {
  print "WIN mode"
  (
    borders
    width=12
    $"active_color=(rose-pine dawn gold)"
    $"inactive_color=(rose-pine dark subtle)"
  )
}

export def spc [] {
  print "SPC mode"
  (
    borders
    width=12
    $"active_color=(rose-pine dark love)"
    $"inactive_color=(rose-pine dark muted)"
  )
}
