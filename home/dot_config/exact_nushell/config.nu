$env.config.edit_mode = "vi"
$env.config.show_banner = false

$env.config.use_kitty_protocol = true

source ./secrets.nu

const NU_LIB_DIRS = [
  ($nu.default-config-dir | path join "lib")
]

$env.BROWSER = 'open'
$env.PAGER = 'less'
$env.LANG = 'en_US.UTF-8'

$env.LESS = '-g -i -M -R -S -w -X -z-4'
which lesspipe lesspipe.sh
| if ($in | is-not-empty) {
  $env.LESSOPEN = $"| /usr/bin/env ($in.0.command) %s 2>&-"
}

$env.MANPAGER = "nvim +Man!"
$env.MANWIDTH = 999

use xdg
use xdg constants *
use std
use job

# Setup mise
let mise_path = (xdg cache "mise" "init.nu")
if not ($mise_path | path exists) {
  ^mise activate nu | save --force $mise_path
}
use ~/.cache/mise/init.nu

# # Setup starship
# let starship_path = (xdg cache starship init.nu)
# mkdir (xdg cache "starship")
# starship init nu | save -f (xdg cache "starship" "init.nu")
# use ~/.cache/starship/init.nu
#
# Setup carapace
$env.CARAPACE_BRIDGES = [zsh bash fish] | str join ","
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu

# Setup jc
mkdir ~/.local/share/bash/bash_completion
^jc --bash-comp | save --force ~/.local/share/bash/bash_completion/jc

# Setup chezmoi
mkdir ~/.config/fish/completions
^chezmoi completion fish | save --force ~/.config/fish/completions/chezmoi.fish

use cfg
source ls-colors.nu

#
# Setup custom modules
#
use xdg

use fzf setup-fzf
setup-fzf

use yazi
use yazi aliases *

use chezmoi aliases *

use brew aliases *
use brew

use tx
use tx aliases *

use notes
use notes aliases *

use ms
use ms aliases *

use fonts

# Setup background jobs
use job
job launch
job set-parallel-limit -g dark-notify 3 o+e> (std null-device)

if (
  job status
  | where label == tmux-reset
      and group == dark-notify
      and status == Running
  | is-empty
) {
  job spawn --label tmux-reset --group "dark-notify" {
    dark-notify -c (xdg bin tmux-reset)
  } o+e> (std null-device)
}

if (
  job status
  | where label == spotify-player-theme
      and group == dark-notify
      and status == Running
  | is-empty
) {
  job spawn --label spotify-player-theme --group dark-notify {
    dark-notify -c (xdg bin spotify-player-theme)
  } o+e> (std null-device)
}

if (
  job status
  | where label == btop-switch-appearance
      and group == dark-notify
      and status == Running
  | is-empty
) {
  job spawn --label btop-switch-appearance --group dark-notify {
    dark-notify -c (xdg bin btop-switch-appearance)
  } o+e> (std null-device)
}

use opencommit
use opencommit aliases *

alias lg = lazygit

alias ms = mise
alias msr = mise run
alias msx = mise exec
alias mst = mise task

alias la = ls -la
alias ll = ls -l

def git-push-pull [] {
  git pull
  git push
}

alias gco = git checkout
alias gf = git fetch
alias gfm = git pull
alias gpp = git-push-pull
alias gwd = git diff
alias gwS = git status
alias gws = git status --short

alias tf = terraform
alias tfp = terraform plan -out tfplan
alias tfa = terraform apply tfplan
alias tfA = terraform apply -auto-approve

alias brews = brew search
alias casks = brew search --cask
alias brewi = brew install
alias caski = brew install --cask
alias brewh = brew home
alias caskh = brew home --cask
alias brewn = brew info
alias caskn = brew info --cask
alias brewu = brew upgrade
alias casku = brew upgrade --cask
alias brewx = brew uninstall
alias caskx = brew uninstall --cask

def location-show []: nothing -> any {
  http get https://dnsleaktest.com
  | mise x ubi:mgdm/htmlq -- htmlq --text '.welcome > p'
  | lines -s | str join " "
  | parse -r '^Hello (?<ip>.*?) from (?<city>.*?), (?<country>.*?)$'
}

def location-set []: nothing -> table {
  let locations = ^tailscale exit-node list | complete | get stdout
    | lines -s | str trim | drop 3 | split column -n 5 -r '\s{2,}'
    | headers | rename -b { str downcase }

  let country = $locations | get country | uniq | sort
    | input list --fuzzy 'Choose country'

  let city = $locations | where country == $country
    | get city | uniq | sort
    | input list --fuzzy 'Choose city'

  let hostname = $locations | where country == $country and city == $city
    | get hostname | uniq | sort
    | input list --fuzzy 'Choose hostname'

  [
    set
    --exit-node
    $hostname
  ] | run-external tailscale ...$in
}
