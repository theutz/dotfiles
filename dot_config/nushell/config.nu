# Basic settings
$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.use_kitty_protocol = true
$env.config.render_right_prompt_on_last_line = false
$env.config.history.max_size = 10000
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi magenta)  (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi green)  (ansi reset)"

# Load plugins
plugin use gstat
plugin use query
plugin use formats

# Setup appearance
use with-appearance.nu
use std/config [light-theme, dark-theme]
$env.config.color_config = with-appearance { light-theme } { dark-theme }
hide std/config

# Setup keybindings
source custom-bindings.nu

# Setup starship prompt
source init-starship.nu

# Initialize mise
use ($nu.data-dir | path join mise.nu)

# Setup zoxide
source ($nu.data-dir | path join zoxide.nu)

# Setup yazi
source yazi.nu

# Setup chezmoi
use chezmoi/externals.nu *
use chezmoi/aliases.nu *

# Setup git aliases
use git-aliases.nu *
use catppuccin.nu

# Setup homebrew aliases
use brew.nu *

# Setup sketchybar helpers
use sketchybar.nu *

# Setup aliases
source aliases.nu

# Convert a record into .
def "into env" []: record -> string {
  items {|k,v| $"($k)=($v)" }
  | str join "\n"
}
