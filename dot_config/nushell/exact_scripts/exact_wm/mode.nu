use rose-pine

export def default [] {
  print "DEFAULT mode"
  (
    borders
    $"active_color=(rose-pine dark foam)"
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
    style=round
    $"active_color=(rose-pine dark gold)"
    $"inactive_color=(rose-pine dark base argb 44)"
  )
}

export def spc [] {
  print "SPC mode"
  (
    borders
    width=16
    style=square
    $"active_color=(rose-pine dark love)"
    $"inactive_color=(rose-pine dark rose argb 88)"
  )
}

export def go-back [] {
  print "Go back one mode"
  skhd -k escape
}

export def goto-root [] {
  print "Return to root mode"
  skhd -k shift - escape
}
