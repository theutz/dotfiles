def themes [] {
  [
    [role    dark   moon   dawn ];
    [base    191724 232136 faf4ed]
    [surface 1f1d2e 2a273f fffaf3]
    [overlay 26233a 393552 f2e9e1]
    [muted   6e6a86 6e6a86 9893a5]
    [subtle  908caa 908caa 797593]
    [text    e0def4 e0def4 575279]
    [love    eb6f92 eb6f92 b4637a]
    [gold    f6c177 f6c177 ea9d34]
    [rose    ebbcba ea9a97 d7827e]
    [pine    31748f 3e8fb0 286983]
    [foam    9ccfd8 9ccfd8 56949f]
    [iris    c4a7e7 c4a7e7 907aa9]
    [hi-low  21202e 2a283e f4ede8]
    [hi-med  403d52 44415a dfdad9]
    [hi-high 524f67 56526e cecacd]
  ]
}

def variants [] {
  themes | columns | drop nth 0
}

def role [] {
  themes | get role
}

def format [] {
  [argb]
}

export def main [
  variant: string@variants,
  role: string@role,
  format: string@format = argb,
  opacity: string = ff
] {
  (themes | where role == $role
    | (get $variant).0
    | match ($format) {
        argb => { $"0x($opacity)($in)" }
      })
}

