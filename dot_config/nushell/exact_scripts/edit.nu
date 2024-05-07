# Edit skhd config
export def "edit skhd" [] { _main .config/skhd }

# Edit yabai config
export def "edit yabai" [] { _main .config/yabai/yabairc }

# Edit aliases
export def "edit aliases" [] { _main .config/nushell/scripts/aliases.nu }

# Edit this edit command
export def "edit edit" [] { _main .config/nushell/scripts/edit.nu }

def _main [file: string] {
  with-env { VISUAL: nvim } { ^chezmoi edit --watch ([$env.HOME $file] | str join "/") }
}
