# Basic settings
$env.config.show_banner = false
$env.config.edit_mode = "vi"

use std/config [light-theme, dark-theme]
$env.config.color_config = (
  dark-mode status
  | complete
  | get stdout
  | str trim
  | match $in {
    on => (dark-theme)
    off => (light-theme)
  }
)

# Initialize starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
use starship.nu
starship set-config-path
hide strsh

# Initialize mise
use ($nu.default-config-dir | path join mise.nu)

# Setup yazi wrapper
def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

# Setup chezmoi
alias cm = chezmoi

# Setup zoxide
source ($nu.default-config-dir | path join zoxide.nu)
