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

