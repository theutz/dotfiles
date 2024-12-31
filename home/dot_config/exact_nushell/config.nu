$env.config.edit_mode = "vi"
$env.config.show_banner = false

def --wrapped add-fish-cmp [
  file: string
  ...cmd: string
] {
  use mod/xdg

  let file = xdg config fish completions $file
  # let cmd = $cmd | str join ' '

  $"^($cmd | first) ($cmd | skip | str join ' ') | save -f ($file)"
  | $"nu -c '($in)'"
  | ^pueue add -- $in o+e> /dev/null
}

add-fish-cmp chezmoi.fish chezmoi completion fish
add-fish-cmp zellij.fish zellij setup --generate-completion fish

let fish_completer = {|spans|
  fish --command $'complete "--do-complete=($spans | str join " ")"'
  | from tsv --flexible --noheaders --no-infer
  | rename value description
}

$env.config.completions.external = {
  enable: true
  completer: $fish_completer
}

use scr/mise.nu
use mod/xdg
use mod/conf
use mod/yazi y
use mod/chezmoi *
