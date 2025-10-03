const common = path self

$env.PLUGIN_DIR = [($common | path dirname) plugins] | path join
$env.FONT = "BlexMono Nerd Font Propo"
$env.APPEARANCE = [$env.HOME .local state appearance] | path join
  | if ($in | path exists) { open $in } else { "dark" }

let theme = (nu -e 'rose-pine | to json' | complete | $in.stdout | from json)

def "font" [
  --bold (-b)
  --size = 14
  --scale = 1.0
] {
  let weight = if ($bold) { "Bold" } else { "Normal" }
  let height = $size * $scale | math round | into float
  ["Maple Mono NF" $weight $height]
  | str join ":"
}

def "into argb" [--alpha (-a): string = "FF"]: string -> string {
  $in | str replace "#" "" | ["0x" $alpha $in] | str join
}

def "icon color" [ --highlight (-h) ]: nothing -> string {
  if ($highlight) { $theme.foam } else { $theme.pine } | into argb
}

def "icon alias color" [--highlight (-h)]: nothing -> string {
  if ($highlight) { $theme.iris } else { $theme.gold } | into argb
}

def "label color" [--highlight (-h)]: nothing -> string {
  if ($highlight) { $theme.gold } else { $theme.text } | into argb
}

def "background color" [--highlight (-h)]: nothing -> string {
  if ($highlight) { $theme.rose } else { $theme.overlay } | into argb -a "ff"
}

def "bar color" [--highlight (-h)]: nothing -> string {
  if ($highlight) {
    $theme.love | into argb -a "cc"
  } else {
    $theme.base | into argb -a "88"
  }
}

def height [multiplier: float = 1.0]: nothing -> int {
  38 * $multiplier | math round
}

def padding [multiplier: float = 1.0]: nothing -> int {
  6 * $multiplier | math round
}

