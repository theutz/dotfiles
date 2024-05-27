use rose-pine

export def default [] {
  print "DEFAULT mode"
  (
    borders
    $"active_color=0xff(rose-pine dark foam)"
    $"inactive_color=0x88(rose-pine dark base)"
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
    $"active_color=0xff(rose-pine dark gold)"
    $"inactive_color=0x44(rose-pine dark base)"
  )
}

export def spc [] {
  print "SPC mode"
  (
    borders
    width=16
    style=square
    $"active_color=0xff(rose-pine dark love)"
    $"inactive_color=0x88(rose-pine dark rose)"
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
