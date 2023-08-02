#
# Aliases
#

alias aic="aicommits"
alias b="buku"
alias brewk="brew info"
alias brewp="brew services"
alias brewpr="brew services restart"
alias brewps="brew services start"
alias brewpx="brew services stop"
alias caskk="brew info --cask"
alias cat="bat"
alias cd="z"
alias cm="chezmoi"
alias cma="chezmoi add"
alias cmA="chezmoi apply -v"
alias cmcd="chezmoi cd"
alias cmls="chezmoi managed"
alias cmlS="chezmoi unmanaged"
alias cmm="chezmoi merge"
alias cmM="chezmoi merge-all"
alias cmr="chezmoi re-add"
alias cms="chezmoi status"
alias ez="exec zsh"
alias giaa="git add -A"
alias gpge="tmux switch-client -t home:gpg-cfg"
alias hosts="sudo nvim /etc/hosts && dscacheutil -flushcache"
alias ls="lsd"
alias md="mkdir -p"
alias nvime="tmux switch-client -t home:nvim-cfg"
alias r="ranger"
alias ranger="source ranger"
alias sa='print -z $(alias | fzf | awk -F '"'"'='"'"' '"'"'{ print $1 }'"'"') '
alias sshe="tmux switch-client -t home:ssh-cfg"
alias tx="tmux"
alias txa="tmux new-session -A"
alias txe="tmux switch-client -t home:tmux-cfg"
alias txls="tmux list-sessions"
alias txp="tmuxp"
alias txpe="tmux switch-client -t home:tmuxp-cfg"
alias txpl="tmuxp load -d"
alias txpL="tmuxp load"
alias v="valet"
alias zshe="tmux switch-client -t home:zsh-cfg"

#
# Suffix Aliases
#
alias -s {md,markdown,mkdwn}="glow -p"

