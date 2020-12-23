export GPG_TTY=$(tty)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
