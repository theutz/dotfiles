$env.NU_LIB_DIRS = [
  $nu.default-config-dir
]

# Setup mise
let mise_path = $nu.default-config-dir | path join "scr" mise.nu
^mise activate nu | save $mise_path --force

use mod/xdg

# Setup starship
mkdir (xdg cache "starship")
starship init nu | save -f (xdg cache "starship" "init.nu")

# Setup carapace
## ~/.config/nushell/env.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir (xdg cache "carapace")
carapace _carapace nushell | save --force (xdg cache "carapace" "init.nu")

