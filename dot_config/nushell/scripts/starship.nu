# Run starship initialization code
export def init []: nothing -> nothing {
  let dir = $nu.data-dir | path join vendor autoload
  let file = $dir | path join starship.nu

  mkdir $dir
  run-external starship init nu | save -f ($file)
}

def get-file [...args: path]: nothing -> path {
  $env.XDG_CONFIG_HOME?
  | default ($env.HOME | path join .config)
  | path join starship ...$args
}

def base-path []: nothing -> path {
  get-file base.toml
}

def palettes-path []: nothing -> path {
  get-file palettes.toml
}

def light-path []: nothing -> path {
  get-file light.toml
}

def dark-path []: nothing -> path {
  get-file dark.toml
}

# Combine base config with other config files
def construct []: nothing -> record {
  open (base-path)
  | merge (open (palettes-path))
}

# Remove properties not recognized by starship
def remove-invalid []: record -> record {
  reject light_palette dark_palette
}

# Set palette property based on light_palette property
def make-light []: record -> record {
  upsert palette {|it| $it.light_palette }
  | remove-invalid
}

# Set palette property based on dark_palette property
def make-dark []: record -> record {
  upsert palette {|it| $it.dark_palette }
  | remove-invalid
}

# Render and save the starship config for light and dark modes
export def render []: nothing -> string {
  construct
  | tee { make-light | save --force (light-path) }
  | tee { make-dark | save --force (dark-path) }
  | ignore
}

# Based on the current system appearance, output the path
# to be used for $env.STARSHIP_CONFIG
export def config-path []: nothing -> path {
  run-external dark-mode status
  | complete | get stdout | str trim
  | match $in {
    on => (dark-path)
    off => (light-path)
    _ => {
      error make {
        msg: "Unknown appearance"
        label: { text: "This value", span: (metadata $in).span }
      }
    }
  }
}

# Set the starship config path based on current system appearance.
export def --env set-config-path []: nothing -> nothing {
  $env.STARSHIP_CONFIG = config-path
}
