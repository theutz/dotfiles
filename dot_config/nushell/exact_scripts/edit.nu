use xdg.nu

def scripts-path [
  ...paths: string
] {
  ($nu.default-config-dir | path join scripts ...$paths)
}

def edit-in-shell [
  ...paths: string
  --file (-f): string
] {
  enter ($paths | str join)
  try {
    run-external $env.EDITOR (if ($file | is-not-empty) { $file } else { '.' })
  } 
  dexit
}

# Edit the skhd configuration files
export def skhd [] {
  edit-in-shell (xdg config skhd) -f skhdrc
}

# Edit the skhd nu module
export def "skhd nu" [] {
  edit-in-shell (scripts-path skhd)
}

# Edit the chezmoi repository
export def chezmoi [] {
  edit-in-shell (^chezmoi source-path)
}

# Edit the brew nu module
export def "brew nu" [] {
  edit-in-shell (scripts-path brew)
}

# Edit the tmuxp session files
export def tmuxp [] {
  edit-in-shell (xdg config tmuxp)
}

# Edit the tmux config
export def tmux [] {
  edit-in-shell (xdg config tmux)
}

# Edit the tmux nushell module
export def "tmux nu" [] {
  edit-in-shell (scripts-path tmux)
}

# Edit the window manager module
export def wm [] {
  edit-in-shell (scripts-path wm)
}

# Edit the yabai config
export def yabai [] {
  edit-in-shell (xdg config yabai)
}

# Edit the yabai nushell module
export def "yabai nu" [] {
  edit-in-shell (scripts-path yabai)
}

# Edit aliases
export def aliases [] {
  edit-in-shell (scripts-path) -f aliases.nu
}

# Edit commands
export def commands [] {
  edit-in-shell (scripts-path) -f commands.nu
}

# Edit nu config
export def nu [] {
  edit-in-shell $nu.default-config-dir -f config.nu
}

# Edit nu env
export def env [] {
  edit-in-shell $nu.default-config-dir -f env.nu
}
