def f [] {
  let editor = $env.VISUAL? | default $env.EDITOR? | default "vim"
  ^fzf --multi | complete
  | if ($in.exit_code > 0) {
    run-external $editor $in.stdout
  }
}
