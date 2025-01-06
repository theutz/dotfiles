use xdg

# Edit a file in XDG_CONFIG_HOME
def "config edit" [...files: string]: nothing -> nothing {
  let paths = $files
  | each {|file|
    $env.XDG_CONFIG_HOME
    | default ( $env.HOME | path join ".config")
    | path join $file
  }
  ^chezmoi edit --apply --watch ...$paths
  exec nu
}

# Edit this configuration file.
def "config config" [] {
  const here = path self
  config edit $here
}

# Edit wezterm configurations.
def "config wezterm" [] { config edit "wezterm/wezterm.lua" }

# Edit nu configurations.
def "config nu" [] { config edit $nu.config-path }

# Edit nu environment configurations.
def "config env" [] { config edit $nu.env-path }

# Edit ~/.config/nushell.
def "config nushell" [] { config edit $nu.default-config-dir }

# Edit homemade notes module
def "config notes" [] { config edit ($nu.default-config-dir | path join "lib/notes") }

# Edit neovim confgurations.
def "config nvim" [] { config edit "nvim" }

# Edit lazyvim config files.
def "config nvim config" [] { config edit "nvim/lua/config" }

# Edit neovim plugins.
def "config nvim plugins" [] { config edit "nvim/lua/plugins" }

# Edit neovim keymaps.
def "config nvim keymaps" [] { config edit "nvim/lua/config/keymaps.lua" }

# Edit neovim colors.
def "config nvim colors" [] { config edit "nvim/lua/plugins/colorschemes.lua" }

# Edit starship configurations.
def "config starship" [] { config edit "starship.toml" }

# Edit aerospace configurations.
def "config aerospace" [] { config edit "aerospace/aerospace.toml" }

# Edit tmux configurations.
def "config tmux" [] { config edit "tmux/tmux.conf" }

# Edit tmuxp configurations.
def "config tmuxp" [] { config edit "tmuxp" }

# Edit mise configurations
def "config mise" [] { config edit "mise/config.toml" }

# Edit tx configurations
def "config tx" [] {
  [
    ["lib" "tx" "mod.nu"]
    ["config.nu"]
  ] | each {|p|
    $nu.default-config-dir
    | path join ...$p
  } | config edit ...$in
}
