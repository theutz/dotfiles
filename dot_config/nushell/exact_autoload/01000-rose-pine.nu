def "rose-pine palette" [] {
  [$env.XDG_CONFIG_HOME rose-pine palette.json]
  | path join
  | open $in
}

def "rose-pine variants" [] {
  rose-pine palette | columns
}

def "rose-pine colors" [] {
  rose-pine palette | get (rose-pine variants | first)
  | get role
}

def "rose-pine formats" [] {
  rose-pine palette | get (rose-pine variants | first)
  | reject role | columns
}

def "rose-pine" [
  --format (-f): string@"rose-pine formats" = "hex"
  --variant (-v): string@"rose-pine variants"
  color?: string@"rose-pine colors"
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
