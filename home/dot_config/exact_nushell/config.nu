$env.config.edit_mode = "vi"
$env.config.show_banner = false

# def --wrapped add-fish-cmp [
#   file: string
#   ...cmd: string
# ] {
#   use mod/xdg
#
#   let file = xdg config fish completions $file
#
#   $"^($cmd | first) ($cmd | skip | str join ' ') | save -f ($file)"
#   | $"nu -c '($in)'"
#   | ^pueue add -- $in o+e> /dev/null
# }
# add-fish-cmp chezmoi.fish chezmoi completion fish
# add-fish-cmp zellij.fish zellij setup --generate-completion fish

# def --env setup-completions [] {
#   let fish_completer = {|spans|
#     fish --command $'complete "--do-complete=($spans | str join " ")"'
#     | from tsv --flexible --noheaders --no-infer
#     | rename value description
#   }
#
#   $env.config.completions.external = {
#     enable: true
#     completer: $fish_completer
#   }
# }
# setup-completions

def --env set-ls-colors []: nothing -> nothing {
  ^dark-mode status | match $in {
    on => "catppuccin-mocha",
    off => "catppuccin-latte"
  }
  | ^vivid generate $in | str trim
  | $env.LS_COLORS = $in
}
set-ls-colors

use scr/mise.nu
use mod/xdg
use mod/config
use mod/yazi y
use mod/chezmoi *

# Setup FZF
use mod/fzf setup-fzf
setup-fzf

# Setup starship
use ~/.cache/starship/init.nu

# Setup carapace
source ~/.cache/carapace/init.nu
