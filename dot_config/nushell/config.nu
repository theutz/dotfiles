# Basic settings
$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.use_kitty_protocol = true
$env.config.render_right_prompt_on_last_line = false
$env.config.history.max_size = 10000
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi magenta)  (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi green)  (ansi reset)"

use with-appearance.nu
use std/config [light-theme, dark-theme]
$env.config.color_config = with-appearance { light-theme } { dark-theme }
hide std/config

# Initialize starship
use starship.nu [init, set-config-path]
init
set-config-path
hide starship.nu

# Initialize mise
use ($nu.data-dir | path join mise.nu)

# Setup zoxide
source ($nu.data-dir | path join zoxide.nu)

source yazi.nu
source chezmoi.nu

module "brew extern" {
  def services [] {
    ^brew services list --json | from json
  }

  def complete_inactive_services [] {
    services | where status != started | get name
  }

  def complete_active_services [] {
    services | where status == started | get name
  }

  # List all brew services
  export extern "brew services" []

  # List all brew services
  export extern "brew services list" []

  # Stop active services
  export extern "brew services stop" [
    ...service: string@complete_active_services
  ]

  # Start inactive services
  export extern "brew services start" [
    ...service: string@complete_inactive_services
  ]

  # Restart active services
  export extern "brew services restart" [
    ...service: string@complete_active_services
  ]
}

use "brew extern" *
