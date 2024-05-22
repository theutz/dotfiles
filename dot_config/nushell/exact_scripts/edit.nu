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
        print -e $"($name) is not a nushell module"
        return
      }
  } else {
    if $name == null {
        scripts-path edit.nu
    } else {
      xdg config $name
    }
  }
  | enter-edit $in
}

#export def skhd [
#  --nushell (-n)
#] {
#  if $nushell {
#    enter-edit (scripts-path skhd)
#  } else {
#    enter-edit (xdg config skhd skhdrc)
#  }
#}
#
#export def chezmoi [
#  --nushell (-n)
#] {
#  if $nushell {
#    enter-edit (scripts-path chezmoi)
#  } else {
#    enter-edit (^chezmoi source-path)
#  }
#}
#
#export def tmux [
#  --tmuxp (-p)
#  --theme (-t)
#] {
#  if $tmuxp and $theme {
#    error make {
#      msg: "Cannot use both --tmuxp and --theme",
#      label: {
#        text: "mutually exclusive flags"
#        span: (metadata $tmuxp).span
#      },
#      help: "Please choose one or the other (or neither)"
#    }
#  } else if ($tmuxp) {
#    enter-edit (xdg config tmuxp)
#  } else if ($theme) {
#    enter-edit ($env.HOME | path join code theutz stunning-theme)
#  } else {
#    enter-edit (xdg config tmux)
#  }
#}
#
#export def brew [] {
#  enter-edit (scripts-path brew)
#}
#
#export def pueue [] {
#  enter-edit (scripts-path pueue)
#}
#
#export def wm [] {
#  enter-edit (scripts-path wm)
#}
#
#export def follow [] {
#  enter-edit (scripts-path follow.nu)
#}
#
#export def rose-pine [] {
#  enter-edit (scripts-path rose-pine.nu)
#}
#
#export def yabai [
#  --nushell (-n)
#] {
#  if ($nushell) {
#    enter-edit (scripts-path yabai)
#  } else {
#    enter-edit (xdg config yabai yabairc)
#  }
#}
#
#export def aliases [] {
#  enter-edit (scripts-path aliases.nu)
#}
#
#export def borders [
#  --nushell (-n)
#] {
#  if $nushell {
#    enter-edit (scripts-path borders.nu)
#  } else {
#    use borders.nu
#    enter-edit (xdg config borders bordersrc)
#    borders restart
#  }
#}
#
#export def sketchybar [
#  --nushell (-n)
#] {
#  if ($nushell) {
#    enter-edit (scripts-path sketchybar.nu)
#  } else {
#    enter-edit (xdg config sketchybar sketchybarrc)
#  }
#}
#
#export def nvim [] {
#  enter-edit (xdg config nvim)
#}
#
#export def wezterm [] {
#  enter-edit (xdg config wezterm)
#}
