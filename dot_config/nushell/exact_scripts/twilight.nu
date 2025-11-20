# Tools for moving between dark and light mode

use std-rfc/kv *

export-env {
  $env.APPEARANCE_FILE = ($env.XDG_STATE_HOME | path join appearance)
}

def xdg_config [...parts: string]: nothing -> path {
  $env.XDG_CONFIG_HOME? | default $"($env.HOME)(char psep).config"
  | path join ...$parts
}

def set-helix-theme []: string -> nothing {
  match $in {
    light => "rose_pine_dawn",
    dark => "rose_pine"
  }
  | append (xdg_config helix config.toml)
  | do {|theme, file|    
    open $file | upsert theme $theme | save --force $file
  } ...$in
}

def set-starship-palette [] {
  match $in {
    light => "rose_pine_dawn",
    _ => "rose_pine"
  } 
  | append (xdg_config starship.toml)
  | do {|theme, file|
    open $file | update palette $theme | save --force $file
  } ...$in
}

def do-actions [theme: string]: nothing -> nothing {
  [
    { save --force $env.APPEARANCE_FILE }
    { set-starship-palette }
    { set-helix-theme }
    { xdg_config tmux tmux.conf | tmux source-file $in }
    { aerospace reload-config }
    { sketchybar --reload }
  ]
  | par-each {|action| $theme | do --capture-errors $action }
}

# Ensure apps are up-to-date with appearance
export def sync []: nothing -> nothing {
  detect | do-actions $in | ignore
}

# Detect whether we're in light or dark mode
export def detect []: nothing -> string {
  (uname).operating-system | match $in {
    Darwin => (
      ^dark-mode status | str trim | match $in { on => "dark", off => "light" }
    )
    _ => (error make { msg: $"($in) not yet supported." })
  }
}

# Toggle between dark and light mode
export def toggle []: nothing -> string {
  (uname).operating-system | match $in {
    "Darwin" => (^dark-mode)
    _ => (error make { msg: $"($in) not yet supported."})
  }

  main
}

# Show help for twilight
export def main []: nothing -> string {
  sync
  detect
}
