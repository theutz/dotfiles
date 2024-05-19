use xdg.nu

def editor [...args: any] {
  run-external $env.EDITOR ...$args
}

def scripts-path [
  ...paths: string
] {
  ($nu.default-config-dir | path join scripts ...$paths)
}

def enter-edit [
  ...paths: string
] {
  $paths | path join
    | match ($in | path type) {
        dir => { enter ($in) },
        _ => { enter ($in | path dirname); ($in | path basename) }
      }
    | if ($in | is-not-empty) { editor $in } else { editor }
  dexit
}

# Edit the edit modules
export def main [] {
  enter-edit (scripts-path edit.nu)
}

# Edit the skhd configuration files
export def skhd [] {
  enter-edit (xdg config skhd skhdrc)
}

# Edit the skhd nu module
export def "skhd nu" [] {
  enter-edit (scripts-path skhd)
}

# Edit the chezmoi repository
export def chezmoi [] {
  enter-edit (^chezmoi source-path)
}

# Edit the brew nu module
export def "brew nu" [] {
  enter-edit (scripts-path brew)
}

# Edit the tmuxp session files
export def tmuxp [] {
  enter-edit (xdg config tmuxp)
}

# Edit the tmux config
export def tmux [] {
  enter-edit (xdg config tmux)
}

# Edit the tmux nushell module
export def "tmux nu" [] {
  enter-edit (scripts-path tmux)
}

# Edit the window manager module
export def wm [] {
  enter-edit (scripts-path wm)
}

# Edit the yabai config
export def yabai [] {
  enter-edit (xdg config yabai yabairc)
}

# Edit the yabai nushell module
export def "yabai nu" [] {
  enter-edit (scripts-path yabai)
}

# Edit aliases
export def aliases [] {
  enter-edit (scripts-path aliases.nu)
}

# Edit commands
export def commands [] {
  enter-edit (scripts-path commands.nu)
}

# Edit nu config
export def nu [] {
  enter-edit $nu.default-config-dir config.nu
}

# Edit nu env
export def env [] {
  enter-edit $nu.default-config-dir env.nu
}

# Edit borders
export def borders [] {
  use borders.nu
  enter-edit (xdg config borders bordersrc)
  borders restart
}

# Edit borders nushell module
export def "borders nu" [] {
  enter-edit (scripts-path borders.nu)
}

# Edit the follow nushell module
export def follow [] {
  enter-edit (scripts-path follow.nu)
}

# Edit the rose-pine nushell module
export def rose-pine [] {
  enter-edit (scripts-path rose-pine.nu)
}
