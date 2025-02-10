const NU_LIB_DIRS = [
  ($nu.default-config-dir | path join "lib")
]

$env.config.edit_mode = "vi"
$env.config.show_banner = false
$env.config.use_kitty_protocol = true
$env.config.keybindings = [
  { # Incrementally autocomplete
    name: complete_word,
    modifier: control,
    keycode: char_i,
    mode: vi_insert,
    event: {
      until: [
        { send: historyhintwordcomplete }
        { edit: movewordright select: false }
      ]
    }
  }
]

# Setup mise
let mise_path = ($env.XDG_CONFIG_HOME? | default '~/.config' | path join mise init.nu)
if not ($mise_path | path exists) {
  ^mise activate nu | save --force $mise_path
}
use ~/.cache/mise/init.nu
