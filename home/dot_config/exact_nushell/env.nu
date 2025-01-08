$env.NU_LIB_DIRS = [
  ($nu.default-config-dir | path join "lib")
]

$env.BROWSER = '^open'
$env.PAGER = 'less'
$env.LANG = 'en_US.UTF-8'

$env.LESS = '-g -i -M -R -S -w -X -z-4'

which lesspipe lesspipe.sh
| if ($in | is-not-empty) {
  $env.LESSOPEN = $"| /usr/bin/env ($in.0.command) %s 2>&-"
}

$env.MANPAGER = "nvim +Man!"
$env.MANWIDTH = 999

use lib/xdg
use std

# Setup mise
let mise_path = (xdg cache "mise" "init.nu")
^mise activate nu | save $mise_path --force

# Setup starship
mkdir (xdg cache "starship")
starship init nu | save -f (xdg cache "starship" "init.nu")

# Setup jc
^jc --zsh-comp | save --force (xdg data "zsh/site-functions/_jc")
