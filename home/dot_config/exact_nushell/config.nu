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
