$env.NU_LIB_DIRS = [
  $nu.default-config-dir
]

let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu | save $mise_path --force
