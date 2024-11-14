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
  themes | columns | drop nth 0 | prepend "auto"
}

def role [] {
  themes | get role
}

# set the $env.ROSE_PINE variable
export def --env to-env [] {
  if ($env.ROSE_PINE? | is-empty) {
    $env.ROSE_PINE = (
      dark-notify -e
        | complete
        | get stdout
        | str trim
        | match ($in) {
            "light" => "dawn"
            "dark" => "dark"
          }
    )
  }
}

export def main [
  role: string@role,
  variant: string@variants = 'auto',
] {
    to-env
    let var = match ($variant) {
        "auto" => $env.ROSE_PINE,
        _ => $variant
    }
    themes | where role == $role | (get $var).0
}
