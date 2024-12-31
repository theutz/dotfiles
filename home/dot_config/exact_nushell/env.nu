$env.NU_LIB_DIRS = [
  $nu.default-config-dir
]

let mise_path = $nu.default-config-dir | path join "scr" mise.nu
^mise activate nu | save $mise_path --force

use mod/xdg
