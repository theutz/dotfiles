# A collection of shortcuts for quickly editing configuration files

use mod/xdg

def edit []: path -> nothing {
  ^chezmoi edit --watch $in
  exec nu
}

# Edit this config file
export def main [] {
  const here = path self .
  $here | edit
}

# Edit wezterm config
export def wezterm [] {
  xdg config "wezterm" "wezterm.lua" | edit
}

# Edit zellij config
export def zellij [] {
  xdg config "zellij" "config.kdl" | edit
}

# Edit ghostty config file
export def ghostty [] {
  xdg config "ghostty" "config" | edit
}

# Edit delta diff configuration
export def delta [] {
  xdg config "git" "config" | edit
}

# Edit yazi configuration
export def yazi [] {
  xdg config "yazi" | edit
}

# Edit bat configuration
export def bat [] {
  xdg config "bat" | edit
}

export def tmux [] {
  xdg config "tmux" | edit
}

export use chezmoi.nu
export use nvim.nu
export use nu.nu
