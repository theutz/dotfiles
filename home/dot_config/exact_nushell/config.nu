$env.config.edit_mode = "vi"
$env.config.show_banner = false

source ./lib/config_tools.nu
source ./lib/ls-colors.nu
use ~/.cache/mise/init.nu
use xdg
use yazi y
use chezmoi *

# Setup FZF
use fzf setup-fzf
setup-fzf

# Setup starship
use ~/.cache/starship/init.nu

# Setup carapace
source ~/.cache/carapace/init.nu
