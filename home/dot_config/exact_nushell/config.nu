$env.config.edit_mode = "vi"
$env.config.show_banner = false
# use (path self . | path join "modules" "config.nu")

use ($nu.default-config-dir | path join mise.nu)

use ($nu.default-config-dir | path join "modules" config.nu)
