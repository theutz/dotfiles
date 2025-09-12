export-env {
  $env.CATPPUCCIN_CONFIG_DIR = $env.XDG_CONFIG_HOME?
  | default ($env.HOME | path join .config)
  | path join catppuccin
  $env.CATPPUCCIN_LIGHT_THEME = "latte"
  $env.CATPPUCCIN_DARK_THEME = "mocha"
}

# List all of the themes
export def themes []: nothing -> table<name: string style: string> {
  {
    light: [{ name: latte description: "Our lightest theme harmoniously inverting the essence of Catppuccin's dark themes." }]
    dark: [
      { name: mocha description: "The Original — Our darkest variant offering a cozy feeling with color-rich accents." }
      { name: macchiato description: "Medium contrast with gentle colors creating a soothing atmosphere." }
      { name: frappe description: "A less vibrant alternative using subdued colors for a muted aesthetic." }
    ]
  }
  | transpose style name
  | flatten --all
  | select name style description
}

# Get the color names and values for a given palette
export def palette [
  theme: string@"complete theme names" # The name of the theme
]: nothing -> table<name: string color: string preview: string> {
  [$env.CATPPUCCIN_CONFIG_DIR $"($theme).toml"]
  | path join
  | path expand
  | open $in
  | transpose name color
  | upsert preview {|it| [(ansi $it.color) $it.name (ansi reset)] | str join}
}

def "complete theme names" []: nothing -> list<string> {
  themes | each {|it| select name description | rename -c {name: value} }
}

def "complete color names" []: nothing -> list<string> {
  themes | get 0.name | palette $in | get name
}

def hex-to-argb [alpha: string]: string -> string {
  str replace "#" "" | $"($alpha)($in)" | str upcase | $"0x($in)"
}

# Get a color value from a palette
export def color [
  color: string@"complete color names" # The color name to get
  --mode (-m): string = system # Dark mode, light mode, or system mode
  --alpha (-a): string # If using a format with alpha, use this value
  --argb (-o) # Print in 0xAARRGGBB format
]: nothing -> string {
  match ($mode) {
    dark => $env.CATPPUCCIN_DARK_THEME
    light => $env.CATPPUCCIN_LIGHT_THEME
    system => {
      use with-appearance.nu
      with-appearance { $env.CATPPUCCIN_LIGHT_THEME } { $env.CATPPUCCIN_DARK_THEME }
    }
    _ => { error make {msg: $"Invalid mode: ($mode)" label: { text: "Value should be dark, light, or system", span: (metadata $mode).span }}}
  }
  | palette $in
  | where name == $color
  | get 0.color
  | if ($argb) {
    hex-to-argb ($alpha | default "FF")
  } else {
    $"($in)($alpha | default "")"
  }
}

# Show colors for a theme
export def main [
  theme: string@"complete theme names"
]: nothing -> string {
  $env.CATPPUCCIN_CONFIG_DIR
  | path join $"($theme).toml"
  | path expand
  | open $in
  | items {|key, value|
    [
      (ansi $value)
      $key
      (ansi reset)
    ] | str join
  }
  | grid
}
