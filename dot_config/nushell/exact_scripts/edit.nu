# Edit skhd config
export def "edit skhd" [] { _main .config/skhd/skhdrc }

# Edit yabai config
export def "edit yabai" [] { _main .config/yabai/yabairc }

# Edit aliases
export def "edit aliases" [] { _main .config/nushell/scripts/aliases.nu }

def _main [file: string] {
  with-env { VISUAL: nvim } { ^chezmoi edit --watch ([$env.HOME $file] | str join "/") }
}
