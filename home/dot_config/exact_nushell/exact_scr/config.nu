use mod/chezmoi
use mod/xdg

# Edit a file in XDG_CONFIG_HOME
def "config edit" [...file: string]: nothing -> nothing {
  ^chezmoi edit --apply --watch (
    $env.XDG_CONFIG_HOME | default "~/.config"
    | path join ...$file
  )
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

def "config nushell" [] {
  ^chezmoi edit --watch --apply $nu.default-config-dir
}

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
