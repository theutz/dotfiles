# Setup XDG
$env.XDG_CONFIG_HOME = $env.XDG_CONFIG_HOME? | default ($env.HOME | path join .config)
$env.XDG_DATA_HOME = $env.XDG_DATA_HOME? | default ($env.HOME | path join .local share)
$env.XDG_STATE_HOME = $env.XDG_STATE_HOME? | default ($env.HOME | path join .local state)
$env.XDG_CACHE_HOME = $env.XDG_CACHE_HOME? | default ($env.HOME | path join .cache)

# Set these values for launchctl
if (command -v launchctl | $env.LAST_EXIT_CODE == 0) {
  $env | transpose name value | where name =~ ^XDG_ | each {
    launchctl setenv $in.name $in.value
  }
}

# Setup Nushell Plugins
const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
  ...$NU_PLUGIN_DIRS
]

# Setup path variable
$env.PATH = [
  ($env.HOME | path join bin)
  ($env.XDG_DATA_HOME | path join bob nvim-bin)
  ($env.HOME | path join .local bin)
  /opt/homebrew/bin
  /opt/homebrew/sbin
] ++ $env.PATH

$env.EDITOR = "nvim"
$env.VISUAL = $env.EDITOR
$env.BROWSER = which -a open | last | get path
$env.PAGER = "less"
$env.LESS = "-F -g -i -M -R -S -w -X -z-4"
$env.MANPAGER = "nvim -c +Man!"
$env.MANWIDTH = "999"

use with-appearance.nu
$env.LS_COLORS = with-appearance { "catppuccin-latte" } { "catppuccin-mocha" }
| run-external vivid generate $in

# Activate Mise
let mise_path = $nu.data-dir | path join mise.nu
^mise activate nu
| str replace "--ignore-errors" "--optional"
| save $mise_path --force

# Setup zoxide
zoxide init nushell
| save -f ($nu.data-dir | path join zoxide.nu)
