$env.config.show_banner = false

# Initialize starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Initialize mise
use ($nu.default-config-dir | path join mise.nu)


