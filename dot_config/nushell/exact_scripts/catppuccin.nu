export-env {
  $env.CATPPUCCIN_CONFIG_DIR = $env.XDG_CONFIG_HOME?
  | default ($env.HOME | path join .config)
  | path join catppuccin
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

def "complete names" []: nothing -> list<string> {
  themes | each {|it| select name description | rename -c {name: value} }
}

# Show colors for a theme
export def main [
  theme: string@"complete names"
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
