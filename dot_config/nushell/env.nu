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
