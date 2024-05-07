# Edit skhd config
export def "edit skhd" [] { edit .config/skhd }

# Edit yabai config
export def "edit yabai" [] { edit .config/yabai/yabairc }

# Edit aliases
export def "edit aliases" [] { edit .config/nushell/scripts/aliases.nu }

# Edit this edit command
export def "edit edit" [] { edit .config/nushell/scripts/edit.nu }

# Edit dotfiles
export def edit [
  file?: string # Paths relative to $env.HOME
] {
  let target = if ($file == null) {
    ""
  } else {
    [$env.HOME $file] | str join (char psep)
  }
  ^chezmoi edit $target
}
