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

# Setup keybindings

source custom-bindings.nu

# 8888ba.88ba  oo                   
# 88  `8b  `8b                      
# 88   88   88 dP .d8888b. .d8888b. 
# 88   88   88 88 Y8ooooo. 88ooood8 
# 88   88   88 88       88 88.  ... 
# dP   dP   dP dP `88888P' `88888P' 

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

# Convert a record into .
def "into env" []: record -> string {
  items {|k,v| $"($k)=($v)" }
  | str join "\n"
}

#  _____________________
# < "Config" extensions >
#  ---------------------
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||--WWW |
#                 ||     ||

# Edit general nu aliases.
def "config aliases" [] {
  $NU_LIB_DIRS
  | first
  | path join $NU_ALIASES_FILENAME
  | ^chezmoi edit --apply $in
}

# Edit starship config
def "config starship" [] {
  $env.XDG_CONFIG_HOME | path join "starship.toml" | hx $in
}

# Edit helix config
def "config helix" [] {
  $env.XDG_CONFIG_HOME | path join helix config.toml | hx -w ($in | path dirname) $in
}

# Edit wezterm config
def "config wezterm" [] {
  $env.XDG_CONFIG_HOME | path join wezterm wezterm.lua | hx -w ($in | path dirname) $in
}

# Edit yazi config
def "config yazi" [] {
  let dir = $env.XDG_CONFIG_HOME | path join yazi
  let files = glob --exclude ["package.toml"] $"($dir)/*.{toml,lua}"
  hx -w $dir ...$files
}

# Edit env.nu
def "config env" [] {
  hx -w $nu.default-config-dir $nu.env-path
}

# Edit config.nu
def "config nu" [] {
  hx -w $nu.default-config-dir $nu.config-path
}
