def f [] {
  fzf --multi | complete | $in.stdout | lines
  | run-external ($env.VISUAL? | default $env.EDITOR? | default vim) ...$in
}

alias m = mise
alias mx = mise exec
alias mr = mise run

alias l = ls
alias ll = ls -l
alias la = ls -la

alias lg = lazygit
alias ld = lazydocker
