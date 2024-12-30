# A collection of shortcuts for quickly editing configuration files
use ./xdg.nu

def edit []: path -> nothing {
  ^chezmoi edit --watch $in
}

export module nvim {

  # Edit neovim config
  export def main [] {
    xdg config "nvim"
    | edit
  }

# Edit neovim keymaps
  export def "nvim keymaps" [] {
    xdg config "nvim" "lua" "config" "keymaps.lua"
    | edit
  }

# Edit neovim autocommands
  export def "nvim autocmds" [] {
    xdg config "nvim" "lua" "config" "autocmds.lua"
    | edit
  }

# Edit neovim options
  export def "nvim options" [] {
    xdg config "nvim" "lua" "config" "options.lua"
    | edit
  }
}

# Edit wezterm config
export def "wezterm" [] {
  xdg config "wezterm" "wezterm.lua"
  | edit
}

export def "zellij" [] {
  xdg config "zellij" "config.kdl"
  | edit
}

export def "chezmoi" [] {
  ^chezmoi source-path
    | complete | get stdout | str trim
    | ^$env.EDITOR $in
}

export def "chezmoi scripts" [] {
  ^chezmoi source-path
    | complete | get stdout | str trim
    | path join ".chezmoiscripts"
    | ^$env.EDITOR $in
}

export def "ghostty" [] {
  xdg config "ghostty" "config"
  | edit
}

export def "delta" [] {
  xdg config "git" "config"
  | edit
}

export def "yazi" [] {
  xdg config "yazi"
  | edit
}

export def "config" [] {
  xdg config "nushell"
  | edit
}

