const NU_LIB_DIRS = [
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

use xdg
use xdg constants *
use std
use job

# Setup mise
let mise_path = (xdg cache "mise" "init.nu")
if not ($mise_path | path exists) {
  ^mise activate nu | save --force $mise_path
}
use ~/.cache/mise/init.nu
# use ($XDG_CONFIG_HOME | path join mise init.nu)

# Setup starship
let starship_path = (xdg cache starship init.nu)
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

$env.config.edit_mode = "vi"
$env.config.show_banner = false

use config-config
use config-config aliases *
source ls-colors.nu

# Setup mise
use ~/.cache/mise/init.nu

# Setup FZF
use fzf setup-fzf
setup-fzf

# Setup starship
use ~/.cache/starship/init.nu

# Setup carapace
source ~/.cache/carapace/init.nu

#
# Setup custom modules
#

use xdg

use yazi
use yazi aliases *

use chezmoi aliases *

use brew aliases *
use brew

use tx
use tx aliases *

use notes
use notes aliases *

use ms
use ms aliases *

# Setup background jobs
use job
job launch
if (job status | where group == dark-notify | is-empty) {
  job spawn --label tmux-reset --group "dark-notify" {
    dark-notify -c '~/.local/bin/tmux-reset'
  } o+e> (std null-device)
}

use opencommit
use opencommit aliases *

export alias lg = lazygit
