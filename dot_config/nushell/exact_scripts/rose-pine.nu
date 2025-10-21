export def palette [] {
  [$env.XDG_CONFIG_HOME rose-pine palette.json]
  | path join
  | open $in
}

export def variants [] {
  main palette | columns
}

export def colors [] {
  main palette | get (variants | first)
  | get role
}

export def formats [] {
  main palette | get (variants | first)
  | reject role | columns
}

export def main [
  --format (-f): string@"formats" = "hex"
  --variant (-v): string@"variants"
  color?: string@"colors"
] {
  let var = $variant | default (match ($env.APPEARANCE?) {
    light => "dawn"
    _ => "main"
  })

  [$env.XDG_CONFIG_HOME rose-pine palette.json] | path join
  | open $in | get ($variant | default (match ($env.APPEARANCE?) {
    light => "dawn"
    _ => "main"
  }))
  | select role (match ($format) {
    rgb | hsl | hex => $format
    _ => "hex"
  })
  | transpose --as-record --header-row
  | if ($color | is-not-empty) {
    get $color
  } else { $in }
}
