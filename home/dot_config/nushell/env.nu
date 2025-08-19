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

# Activate Mise
let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu
| str replace "--ignore-errors" "--optional"
| save $mise_path --force

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.LS_COLORS = (vivid generate rose-pine)

# Setup zoxide
zoxide init nushell | save -f ($nu.default-config-dir | path join zoxide.nu)
