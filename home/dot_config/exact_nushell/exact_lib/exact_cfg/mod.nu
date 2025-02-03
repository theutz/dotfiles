use xdg

# Edit a file in XDG_CONFIG_HOME
export def edit [...files: string]: nothing -> nothing {
  let paths = $files | each {|| xdg config }
  ^chezmoi edit --apply --watch ...$paths
  exec nu
}

# Edit this configuration file.
export def main [] {
  const here = path self
  [
    $nu.config-path
    $here
  ]
  | edit ...$in
}

# Edit wezterm configurations.
export def wezterm [] { edit "wezterm/wezterm.lua" }

# Edit nu configurations.
export def nu [] { edit $nu.config-path }

# Edit nu environment configurations.
export def env [] { edit $nu.env-path }

# Edit ~/.config/nushell.
export def all [] { edit $nu.default-config-dir }

# Edit homemade notes module
export def notes [] { edit ($nu.default-config-dir | path join "lib/notes") }

# Edit neovim confgurations.
export module nvim {
  # Edit neovim confgurations.
  export def main [] { edit "nvim" }

  # Edit lazyvim config files.
  export def config [] { edit "nvim/lua/config" }

  # Edit neovim plugins.
  export def plugins [] { edit "nvim/lua/plugins" }

  # Edit neovim keymaps.
  export def keymaps [] { edit "nvim/lua/config/keymaps.lua" }

  # Edit neovim colors.
  export def colors [] { edit "nvim/lua/plugins/colorschemes.lua" }
}

# Edit starship configurations.
export def starship [] { edit "starship.toml" }

# Edit aerospace configurations.
export def aerospace [] { edit "aerospace/aerospace.toml" }

# Edit tmux configurations.
export def tmux [] { edit "tmux/tmux.conf" }

# Edit tmuxp configurations.
export def tmuxp [] { edit "tmuxp" }

# Edit mise configurations
export def mise [] { edit "mise/config.toml" }

# Edit a nushell module
export def edit-mod [name: string]: nothing -> nothing {
  [
    $nu.config-path
    ($nu.default-config-dir | path join lib $name mod.nu)
  ] | edit ...$in
}

# Edit tx configurations
export def tx [] { edit-mod tx }

# Edit ms shortcuts for mise
export def ms [] { edit-mod ms }

# Edit background jobs module
export def job [] { edit-mod job }

# Edit chezomi module
export def chezmoi [] { edit-mod chezmoi }

# Edit a nushell module
export def mod [name?: string] {
  if ($name | is-empty) {
    $nu.default-config-dir
    | path join "lib" "*/mod.nu"
    | glob $in
    | each {|| path dirname | path split | last }
    | input list --fuzzy
  } else {
    $name
  }
  | edit-mod $in
}

# Edit chezmoi configuration
export module chezmoi {
  # Edit .chezmoidata
  export def data [] {
    ^chezmoi source-path
    | str trim
    | path join .chezmoidata
    | ^nvim $in
  }

  # Edit .chezomiscripts
  export def scripts [] {
    ^chezmoi source-path
    | str trim
    | path join .chezmoiscripts
    | ^nvim $in
  }

  # Edit .chezmoitemplates
  export def templates [] {
    ^chezmoi source-path
    | str trim
    | path join .chezmoitemplates
    | ^nvim $in
  }
}

export def sketchybar [] {
  edit (xdg config sketchybar)
}

export def tailscale [] {
  edit-mod tailscale
}

export def zellij [] {
  [
    [zellij ** *]
    [nushell config.nu]
    [nushell lib zellij ** *]
  ]
  | each {
    prepend (xdg config | path split)
    | path join
    | glob $in
  }
  | flatten
  | ^chezmoi edit --watch ...$in
}
