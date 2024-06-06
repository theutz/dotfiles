# Source the main nushell config record

source config/main.nu

# Completions

# Add custom completions

use nu_scripts/custom-completions/bat/bat-completions.nu *
use nu_scripts/custom-completions/composer/composer-completions.nu *
use nu_scripts/custom-completions/curl/curl-completions.nu *
use nu_scripts/custom-completions/gh/gh-completions.nu *
use nu_scripts/custom-completions/git/git-completions.nu *
use nu_scripts/custom-completions/glow/glow-completions.nu *
use nu_scripts/custom-completions/just/just-completions.nu *
use nu_scripts/custom-completions/less/less-completions.nu *

# ASDF

$env.ASDF_DIR = (brew --prefix asdf | str trim | into string | path join 'libexec')
 source /opt/homebrew/opt/asdf/libexec/asdf.nu

# Custom Modules

use edit.nu
use rose-pine.nu
use xdg.nu
use follow.nu
use chezmoi
use service.nu
use pueue.nu
use aliases.nu

# My custom modules
use yab

# Custom Scripts

# My custom scripts
ls -la ~/.ssh | each { $in.name | path split | last } | filter {|x| $x | str starts-with id_ } | filter {|x| not ($x | str ends-with .pub) } |
keychain --eval --quiet ...$in
    | lines
    | where not ($it | is-empty)
    | parse "{k}={v}; export {k2};"
    | select k v
    | transpose --header-row
    | into record
    | load-env

alias chemzoi = chezmoi

def --wrapped editor [...args] {
  let cmd = $env.EDITOR | first
  let flags = $env.EDITOR | drop nth 0
  run-external $cmd ...$flags ...$args
}

def --wrapped visual [...args] {
  let cmd = $env.VISUAL | first
  let flags = $env.VISUAL | drop nth 0
  run-external $cmd ...$flags ...$args
}

alias e = visual
