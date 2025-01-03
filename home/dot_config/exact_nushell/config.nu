$env.config.edit_mode = "vi"
$env.config.show_banner = false

source config_tools.nu
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

use xdg
use yazi y
use chezmoi.nu
