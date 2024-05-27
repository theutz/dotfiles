use xdg.nu

def editor [...args: any] {
  run-external $env.EDITOR ...$args
}

def scripts-path [
  ...paths: string
] {
  ($nu.default-config-dir | path join scripts ...$paths)
}

def enter-edit [
  ...paths: string
] {
  $paths | path join
    | match ($in | path type) {
        dir => { enter ($in) },
        _ => { enter ($in | path dirname); ($in | path basename) }
      }
    | if ($in | is-not-empty) {
        editor $in
      } else {
        editor
      }
  dexit
}

def names [context: string] {
  const both = [yabai skhd chezmoi borders sketchybar]

  ["-n" "--nushell"] | any { $context =~ $in}
    | if $in {
        [brew pueue wm follow rose-pine aliases] ++ $both
      } else {
        [tmux nvim wezterm] ++ $both
      }
    | sort
}

export def main [
  name?: string@names
  --nushell (-n)
] {
  if ($nushell) {
    scripts-path $name
    | if ($in | path exists) {
        $in
      } else if ($in | $"($in).nu" | path exists) {
        $"($in).nu"
      } else {
        print -e $"($name) is not a nushell module."
        return
      }
  } else {
    if $name == null {
      scripts-path edit.nu
    } else {
      xdg config $name | if ($in | path exists) { $in } else {
        print -e $"($in) does not exist."
        return
      }
    }
  }
  | enter-edit $in
}

