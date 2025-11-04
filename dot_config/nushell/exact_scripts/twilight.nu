# Tools for moving between dark and light mode

def xdg_config [...parts: string]: nothing -> path {
  $env.XDG_CONFIG_HOME? | default $"($env.HOME)(char psep).config"
  | path join ...$parts
}

def set-helix-theme []: string -> nothing {
  match $in { light => "rose_pine_dawn", dark => "rose_pine" }
  | do {|theme|
    xdg_config helix config.toml
    | do {|file|
      let content = open $file | update theme $theme
      $content | save --force $file
    } $in
  } $in
}

def do-actions [theme: string]: nothing -> nothing {
  [
    { save --force ($env.XDG_STATE_HOME | path join appearance) }
    { set-helix-theme }
    { xdg_config tmux tmux.conf | tmux source-file $in }
    { aerospace reload-config }
    { sketchybar --reload }
  ]
  | par-each {|action| $theme | do $action }
}

# Ensure apps are up-to-date with appearance
export def sync []: nothing -> nothing {
  detect | do-actions $in
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

  sync
  detect
}

# Show help for twilight
export def main []: nothing -> string {
  toggle
}
