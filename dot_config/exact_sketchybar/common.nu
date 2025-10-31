use std/assert
use std-rfc/path
use rose-pine.nu

const common = path self

$env.PLUGIN_DIR = ($common | path dirname) | path join plugins

$env.FONT = "RecMonoDuotone Nerd Font Propo"

$env.APPEARANCE = $env.HOME
  | path join .local state appearance
  | if ($in | path exists) { open $in } else { "dark" }

let theme = rose-pine
assert ($theme | is-not-empty) "Error loading theme"

def "font" [
  --bold (-b)
  --size = 13
  --scale = 1.0
] {
  [$env.FONT]
  | append (
    if ($bold) { "Bold" } else { "Normal" }
  )
  | append (
    $size * $scale | math round | into float
  )
  | str join :
}

def "into argb" [
  --alpha (-a): string = "FF"
]: string -> string {
  str replace "#" ""
  | ["0x" $alpha $in]
  | str join
}

def "icon color" [
  --highlight (-h)
]: nothing -> string {
  if ($highlight) {
    $theme.rose
  } else {
    $theme.pine
  } | into argb
}

def "icon alias color" [
  --highlight (-h)
]: nothing -> string {
  if ($highlight) {
    $theme.iris
  } else {
    $theme.foam
  } | into argb
}

def "label color" [
  --highlight (-h)
]: nothing -> string {
  if ($highlight) {
    $theme.gold
  } else {
    $theme.text
  } | into argb
}

def "background color" [
  --highlight (-h)
]: nothing -> string {
  if ($highlight) {
    $theme.rose
  } else {
    $theme.overlay
  }
  | into argb -a "ff"
}

def "bar color" [
  --highlight (-h)
]: nothing -> string {
  if ($highlight) {
    $theme.love | into argb -a "cc"
  } else {
    $theme.base | into argb -a "88"
  }
}

def height [
  multiplier: float = 1.0
]: nothing -> int {
  38 * $multiplier | math round
}

def padding [
  multiplier: float = 1.0
]: nothing -> int {
  6 * $multiplier | math round
}

# Add script property
def script [
  name: string
  --click (-c)
]: nothing -> path {
  $env.PLUGIN_DIR
  | path join $name
  | path with-extension "nu"
  | tee {
    assert ($in | path exists) $"($in) does not exist"
  }
  | if ($click) {
      [click_script $in]
    } else {
      [script $in]
    }
  | str join "="
}
