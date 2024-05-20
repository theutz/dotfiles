use xdg.nu

def editor [...args: any] {
  run-external $env.EDITOR ...$args
}

export def scripts-path [
  ...paths: string
] {
  ($nu.default-config-dir | path join scripts ...$paths)
}

export def enter-edit [
  ...paths: string
] {
  $paths | path join
    | match ($in | path type) {
        dir => { enter ($in) },
        _ => { enter ($in | path dirname); ($in | path basename) }
      }
    | if ($in | is-not-empty) { editor $in } else { editor }
  dexit
  exec nu
}

# Edit the edit modules
export def main [] {
  enter-edit (scripts-path edit.nu)
}

# Edit the skhd configuration files
export def skhd [] {
  enter-edit (xdg config skhd skhdrc)
}

# Edit the chezmoi repository
export def chezmoi [] {
  enter-edit (^chezmoi source-path)
}

# Edit the tmuxp session files
export def tmuxp [] {
  enter-edit (xdg config tmuxp)
}

# Edit the tmux config
export def tmux [] {
  enter-edit (xdg config tmux)
}

# Edit the window manager module
export def wm [] {
  enter-edit (scripts-path wm)
}

# Edit the yabai config
export def yabai [] {
  enter-edit (xdg config yabai yabairc)
}

# Edit aliases
export def aliases [] {
  enter (scripts-path)
  ^$env.EDITOR ...(glob (scripts-path "**" aliases.nu))
  dexit
}

# Edit commands
export def commands [] {
  enter-edit (scripts-path commands.nu)
}

# Edit borders
export def borders [] {
  use borders.nu
  enter-edit (xdg config borders bordersrc)
  borders restart
}

# Edit the follow nushell module
export def follow [] {
  enter-edit (scripts-path follow.nu)
}

# Edit the rose-pine nushell module
export def rose-pine [] {
  enter-edit (scripts-path rose-pine.nu)
}

# Edit the sketchybar config
export def sketchybar [] {
  enter-edit (xdg config sketchybar sketchybarrc)
}

export module nu {
  export def main [] {
    enter-edit $nu.default-config-dir config.nu
  }

  export def env [] {
    enter-edit $nu.default-config-dir env.nu
  }

  export def sketchybar [] {
    enter-edit (scripts-dir sketchybar.nu)
  }

  export def borders [] {
    enter-edit (scripts-path borders.nu)
  }

  export def skhd [] {
    enter-edit (scripts-path skhd)
  }

  export def brew [] {
    enter-edit (scripts-path brew)
  }

  export def tmux [] {
    enter-edit (scripts-path tmux.nu)
  }

  export def yabai [] {
    enter-edit (scripts-path yabai)
  }
}
