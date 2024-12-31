# Edit neovim config
export def main [] {
  xdg config "nvim"
  | edit
}

# Edit neovim keymap
export def keymap [] {
  xdg config "nvim" "lua" "config" "keymaps.lua"
  | edit
}

# Edit neovim autocommands
export def autocmds [] {
  xdg config "nvim" "lua" "config" "autocmds.lua"
  | edit
}

# Edit neovim options
export def options [] {
  xdg config "nvim" "lua" "config" "options.lua"
  | edit
}
