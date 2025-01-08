$env.NU_LIB_DIRS = [
  ($nu.default-config-dir | path join "lib")
]

$env.BROWSER = '^open'
$env.PAGER = 'less'
$env.LANG = 'en_US.UTF-8'

$env.LESS = '-g -i -M -R -S -w -X -z-4'

which lesspipe lesspipe.sh
| if ($in | is-not-empty) {
  $env.LESSOPEN = $"| /usr/bin/env ($in.0.command) %s 2>&-"
}

$env.MANPAGER = "nvim +Man!"
$env.MANWIDTH = 999

use lib/xdg
use std

# Setup mise
let mise_path = (xdg cache "mise" "init.nu")
^mise activate nu | save $mise_path --force

# Setup starship
mkdir (xdg cache "starship")
starship init nu | save -f (xdg cache "starship" "init.nu")

# Setup carapace
$env.CARAPACE_BRIDGES = [zsh bash fish] | str join ","
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# Setup jc
mkdir ~/.local/share/bash/bash_completion
^jc --bash-comp | save --force ~/.local/share/bash/bash_completion/jc

# Setup chezmoi
mkdir ~/.config/fish/completions
^chezmoi completion fish | save --force ~/.config/fish/completions/chezmoi.fish
