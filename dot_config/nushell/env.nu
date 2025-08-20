# Setup XDG
[
  [name            value                               ];
  [XDG_CONFIG_HOME ($env.HOME | path join .config)     ]
  [XDG_DATA_HOME   ($env.HOME | path join .local share)]
  [XDG_STATE_HOME  ($env.HOME | path join .local state)]
  [XDG_CACHE_HOME  ($env.HOME | path join .cache)      ]
] | each {|it|
  let cp = $it.name
  | str replace "XDG_" ""
  | str replace "_HOME" ""
  | str downcase

  $env
  | upsert $it.name $it.value
  | upsert xdg {|row| $row | upsert $cp $it.value }
}

# Setup path variable
$env.PATH = [
  ($env.HOME | path join bin)
  ($env.XDG_DATA_HOME | path join bob nvim-bin)
  ($env.HOME | path join .local bin)
  /opt/homebrew/bin
  /opt/homebrew/sbin
] ++ $env.PATH

$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.BROWSER = which -a open | last | get path
$env.PAGER = "less"
$env.LESS = "-F -g -i -M -R -S -w -X -z-4"
$env.MANPAGER = "nvim -C +Man!"
$env.MANWIDTH = "999"

use with-appearance.nu
$env.LS_COLORS = with-appearance { "catppuccin-latte" } { "catppuccin-mocha" }
| run-external vivid generate $in

# Activate Mise
let mise_path = $nu.data-dir | path join mise.nu
^mise activate nu
| str replace "--ignore-errors" "--optional"
| save $mise_path --force

# Setup zoxide
zoxide init nushell
| save -f ($nu.data-dir | path join zoxide.nu)
