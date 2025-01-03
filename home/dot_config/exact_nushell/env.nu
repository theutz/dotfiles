$env.NU_LIB_DIRS = [
  ($nu.default-config-dir | path join "lib")
]

use lib/xdg
use std
use lib/task

# Setup mise
let mise_path = (xdg cache "mise" "init.nu")
^mise activate nu | save $mise_path --force

# Setup starship
mkdir (xdg cache "starship")
starship init nu | save -f (xdg cache "starship" "init.nu")

# Setup carapace
$env.CARAPACE_BRIDGES = [
  zsh
  fish
  bash
  # inshellisense
] | str join ","
mkdir (xdg cache "carapace")
carapace _carapace nushell | save --force (xdg cache "carapace" "init.nu")
