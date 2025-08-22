# Basic settings
$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.use_kitty_protocol = true
$env.config.render_right_prompt_on_last_line = false
$env.config.history.max_size = 10000
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi magenta)  (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi green)  (ansi reset)"

# Keybindings
$env.config.keybindings ++= [
  {
    name: add_pager
    modifier: alt
    keycode: char_p
    mode: [emacs vi_insert vi_normal]
    event: {
      send: executehostcommand
      cmd: "commandline | if (($in | str length) == 0) { history | last | get command } else { $in } | $'($in) | ($env.PAGER)' | commandline edit $in"
    }
  }
  {
    name: add_sudo
    modifier: alt
    keycode: char_s
    mode: [emacs vi_insert vi_normal]
    event: {
      send: executehostcommand
      cmd: "commandline | if (($in | str length) == 0) { history | last | get command } else { $in } | $'sudo ($in)' | commandline edit $in"
    }
  }
]

use with-appearance.nu
use std/config [light-theme, dark-theme]
$env.config.color_config = with-appearance { light-theme } { dark-theme }
hide std/config

# Initialize starship
use starship.nu [init, set-config-path, render]
job spawn { render }
init
set-config-path
hide starship.nu

# Initialize mise
use ($nu.data-dir | path join mise.nu)

# Setup zoxide
source ($nu.data-dir | path join zoxide.nu)

source yazi.nu
use chezmoi *
use git-aliases.nu *
use catppuccin.nu
plugin use emoji
plugin use gstat
plugin use query

alias sp = if (which -a spotify_player | is-not-empty) { spotify_player } else { run-external ...[open -a Spotify] }

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
