use xdg

# Edit a file in XDG_CONFIG_HOME
export def "edit" [...files: string]: nothing -> nothing {
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
export def "wezterm" [] { edit "wezterm/wezterm.lua" }

# Edit nu configurations.
export def "nu" [] { edit $nu.config-path }

# Edit nu environment configurations.
export def "env" [] { edit $nu.env-path }

# Edit ~/.config/nushell.
export def all [] { edit $nu.default-config-dir }

# Edit homemade notes module
export def "notes" [] { edit ($nu.default-config-dir | path join "lib/notes") }

# Edit neovim confgurations.
export def "nvim" [] { edit "nvim" }

# Edit lazyvim config files.
export def "nvim config" [] { edit "nvim/lua/config" }

# Edit neovim plugins.
export def "nvim plugins" [] { edit "nvim/lua/plugins" }

# Edit neovim keymaps.
export def "nvim keymaps" [] { edit "nvim/lua/config/keymaps.lua" }

# Edit neovim colors.
export def "nvim colors" [] { edit "nvim/lua/plugins/colorschemes.lua" }

# Edit starship configurations.
export def "starship" [] { edit "starship.toml" }

# Edit aerospace configurations.
export def "aerospace" [] { edit "aerospace/aerospace.toml" }

# Edit tmux configurations.
export def "tmux" [] { edit "tmux/tmux.conf" }

# Edit tmuxp configurations.
export def "tmuxp" [] { edit "tmuxp" }

# Edit mise configurations
export def "mise" [] { edit "mise/config.toml" }

# Edit a nushell module
export def "edit-mod" [name: string]: nothing -> nothing {
  [
    $nu.config-path
    $nu.env-path
    ($nu.default-config-dir | path join lib $name mod.nu)
  ] | edit ...$in
}

# Edit tx configurations
export def "tx" [] { edit-mod tx }

# Edit ms shortcuts for mise
export def "ms" [] { edit-mod ms }

# Edit background jobs module
export def "job" [] { edit-mod job }

# Edit chezomi module
export def "cm" [] { edit-mod chezmoi }

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

export module aliases {
  export alias cfg = main
}

