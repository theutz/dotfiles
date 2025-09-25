#                                /----------------\
#                                | Basic settings |
#                                \----------------/
#                                      \
#                                       \
#                                        \
#
#   
#                                            .--.
#                                           {(~~)}
#                          __..._         _.''''O`,._
#                      _.-'      '~-._.-~~     (  .__}
#                   _-~                       _.`--
#                _-~     _         /~\    _.-~     
#             _-~     ,-~ ~-.      \\ ) .~
#           .'       {       )      \\|'
#         .'         {       /  _.-' |:
#       .'            \     /.-'     \\
#     .'        __.-~.=\   /          `}
#     ;      _.-~   / ./ |  }
#     {    _.'     / /   | /
#     {    =      {=+__  | :
#     :   :_      `-- = \,_`-,.
#      `.   '=,_
#         '-.___'_::='
#   

$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.use_kitty_protocol = true
$env.config.render_right_prompt_on_last_line = false
$env.config.history.max_size = 10000
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi magenta)  (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi blue)  (ansi reset)"

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

# Initialize mise

use ($nu.data-dir | path join mise.nu)

#  ____       _                              _     _      
# / ___|  ___| |_ _   _ _ __    _________  _(_) __| | ___ 
# \___ \ / _ \ __| | | | '_ \  |_  / _ \ \/ / |/ _` |/ _ \
#  ___) |  __/ |_| |_| | |_) |  / / (_) >  <| | (_| |  __/
# |____/ \___|\__|\__,_| .__/  /___\___/_/\_\_|\__,_|\___|
#                      |_|                                

source ($nu.data-dir | path join zoxide.nu)

# Setup yazi wrapper
def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  ^yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

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
const NU_ALIASES_FILENAME = "aliases.nu"
source $NU_ALIASES_FILENAME

# Edit general nu aliases.
def "config aliases" [] {
  $NU_LIB_DIRS
  | first
  | path join $NU_ALIASES_FILENAME
  | ^chezmoi edit --apply $in
}

# Convert a record into .
def "into env" []: record -> string {
  items {|k,v| $"($k)=($v)" }
  | str join "\n"
}
