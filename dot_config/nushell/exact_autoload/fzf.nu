use std-rfc/path with-extension

$env.FZF_DEFAULT_OPTS = [
    ($env.XDG_CONFIG_HOME? | default $"($env.HOME)(char psep).config")
    fzf
    rose-pine
    dist
    rose-pine.sh
  ]
  | path join
  | open $in
  | lines
  | skip
  | str trim -c '"'
  | str trim
  | str join (char newline)

def f [] {
  let editor = $env.VISUAL? | default $env.EDITOR? | default "vim"
  ^fzf --multi | complete
  | if ($in.exit_code > 0) {
    run-external $editor $in.stdout
  }
}
