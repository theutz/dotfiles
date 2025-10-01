$env.config.show_banner = false
$env.config.edit_mode = "vi"

use std/config [light-theme dark-theme]
$env.config.color_config = match ($env.APPEARANCE) {
  light => (light-theme)
  _ => (dark-theme)
}

$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi green_dimmed)(ansi reset) "
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi magenta)󰗧(ansi reset) "
$env.PROMPT_MULTILINE_INDICATOR = $"(ansi cyan):::::(ansi reset) "
