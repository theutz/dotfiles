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

export def main [
] {
  help modules edit
}

export def skhd [] {
  enter-edit (xdg config skhd skhdrc)
}

export def chezmoi [] {
  enter-edit (^chezmoi source-path)
}

export def tmuxp [] {
  enter-edit (xdg config tmuxp)
}

export def tmux [] {
  enter-edit (xdg config tmux)
}

export def tmux-theme [] {
  enter-edit ($env.HOME | path join code theutz stunning-theme)
}

export def yabai [] {
  enter-edit (xdg config yabai yabairc)
}

export def aliases [] {
  enter (scripts-path)
  ^$env.EDITOR ...(glob (scripts-path "**" aliases.nu))
  dexit
}

export def commands [] {
  enter-edit (scripts-path commands.nu)
}

export def borders [] {
  use borders.nu
  enter-edit (xdg config borders bordersrc)
  borders restart
}

export def sketchybar [] {
  enter-edit (xdg config sketchybar sketchybarrc)
}

export def nvim [] {
  enter-edit (xdg config nvim)
}

export def wezterm [] {
  enter-edit (xdg config wezterm)
}

module scripts {
  export def main [] {
    enter-edit $nu.default-config-dir config.nu
  }

  export def env [] {
    enter-edit $nu.default-config-dir env.nu
  }

  export def sketchybar [] {
    enter-edit (scripts-path sketchybar.nu)
  }

  export def borders [] {
    enter-edit (scripts-path borders.nu)
  }

  export def skhd [] {
    enter-edit (scripts-path skhd)
  }

  export def edit [] {
    enter-edit (scripts-path edit.nu)
  }

  export def brew [] {
    enter-edit (scripts-path brew)
  }

  export def yabai [] {
    enter-edit (scripts-path yabai)
  }

  export def chezmoi [] {
    enter-edit (scripts-path chezmoi)
  }

  export def pueue [] {
    enter-edit (scripts-path pueue)
  }

  export def wm [] {
    enter-edit (scripts-path wm)
  }

  export def follow [] {
    enter-edit (scripts-path follow.nu)
  }

  export def rose-pine [] {
    enter-edit (scripts-path rose-pine.nu)
  }
}

export use scripts
