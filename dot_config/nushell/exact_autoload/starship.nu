use std-rfc/path with-extension

$env.STARSHIP_CONFIG = $env.APPEARANCE?
  | match $in {
    light => "rose-pine-dawn"
    _ => "rose-pine"
  }
  | [
    ($env.XDG_CONFIG_HOME? | default $"($env.HOME)(char psep).config")
    starship
    rose-pine
    $in
  ]
  | path join
  | with-extension "toml"

starship init nu | save -f ($nu.data-dir | path join vendor autoload starship.nu)
