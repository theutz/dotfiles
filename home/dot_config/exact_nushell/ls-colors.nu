def --env set-ls-colors []: nothing -> nothing {
  ^dark-mode status | match $in {
    on => "catppuccin-mocha",
    off => "catppuccin-latte"
  }
  | ^vivid generate $in | str trim
  | $env.LS_COLORS = $in
}

set-ls-colors
