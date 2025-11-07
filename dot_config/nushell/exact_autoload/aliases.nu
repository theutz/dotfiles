alias cat = bat

def --wrapped l [name: path = ".", ...$args] { ls --all $name ...$args | grid --icons --color }
alias ll = ls -l
alias la = ls -la

alias lg = lazygit
alias ld = lazydocker
alias j = jjui

alias sp = spotify_player

use tm.nu
alias tp = tm new-session-from-template
alias tP = tm edit-template
alias t = tmux
