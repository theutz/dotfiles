$env.config.edit_mode = "vi"
$env.config.show_banner = false

let fish_completer = {|spans|
  fish --command $'complete "--do-complete=($spans | str join " ")"'
  | from tsv --flexible --noheaders --no-infer
  | rename value description
}

$env.config.completions.external = {
  enable: true
  completer: $fish_completer
}

use mise.nu
use my/xdg.nu
use my/conf
use my/chezmoi
use my/yazi.nu y
