# A collection of shortcuts for quickly editing configuration files
use my/xdg.nu

def edit []: path -> nothing {
  ^chezmoi edit --watch $in
}

def src-edit [file?: path]: path -> nothing {
  ^chezomi source-path $file
    | complete | get stdout | str trim
    | ^$env.EDITOR $file
}

# Edit this config file
export def main [] {
  const here = path self .
  $here | edit
}

# Edit wezterm config
export def "wezterm" [] {
  xdg config "wezterm" "wezterm.lua"
  | edit
}

# Edit zellij config
export def "zellij" [] {
  xdg config "zellij" "config.kdl"
  | edit
}


# Edit chezmoi files
export module chezmoi {

  # Edit all chezmoi files
  export def "main" [] {
    src-edit
  }

  # Edit files in .chezmoiscripts
  export def "scripts" [] {
    src-edit ".chezmoiscripts"
  }

  # Edit files in .chezmoidata
  export def "data" [] {
    src-edit ".chezmoidata"
  }
}

# Edit ghostty config file
export def "ghostty" [] {
  xdg config "ghostty" "config"
  | edit
}

# Edit delta diff configuration
export def "delta" [] {
  xdg config "git" "config"
  | edit
}

# Edit yazi configuration
export def "yazi" [] {
  xdg config "yazi"
  | edit
}

# Edit nushell interactive configuration
export def "nu" [] {
  xdg config "nushell" "config.nu"
  | edit
}

# Edit nushell environment
export def "env" [] {
  xdg config "nushell" "env.nu"
  | edit
}

export use nvim.nu
