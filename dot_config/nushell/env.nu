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

# Set file theme with vivid
use with-appearance.nu
(
  $env.LS_COLORS =
    with-appearance { "catppuccin-latte" } { "catppuccin-mocha" }
    | vivid generate $in
)

# Activate Mise
let mise_path = $nu.data-dir | path join mise.nu
^mise activate nu
| str replace "--ignore-errors" "--optional"
| save $mise_path --force

# Setup zoxide
zoxide init nushell
| save -f ($nu.data-dir | path join zoxide.nu)

# Setup FZF
$env.FZF_DEFAULT_OPTS = {
  latte: "--color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39
    --color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78
    --color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39
    --color=selected-bg:#BCC0CC
    --color=border:#9CA0B0,label:#4C4F69"
  mocha: "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8
    --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC
    --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8
    --color=selected-bg:#45475A
    --color=border:#6C7086,label:#CDD6F4"
}
| with-appearance {|theme| $theme.latte } {|theme| $theme.mocha }
| ["--bind=ctrl-a:toggle-all,tab:toggle-out,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down" $in]
| str join "\n"
