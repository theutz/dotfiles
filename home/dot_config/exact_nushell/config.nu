$env.config.edit_mode = "vi"
$env.config.show_banner = false

use cfg
source ls-colors.nu

# Setup mise
use ~/.cache/mise/init.nu

# Setup FZF
use fzf setup-fzf
setup-fzf

# # Setup starship
# use ~/.cache/starship/init.nu

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

use job
job launch

# # job spawn --label "tmux-reset" {
# #   dark-notify -c '~/.local/bin/tmux-reset'
# # }

export alias lg = lazygit
