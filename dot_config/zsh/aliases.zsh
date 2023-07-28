#
# Aliases
#

alias aic="aicommits"
alias brewk="brew info"
alias caskk="brew info --cask"
alias brewp="brew services"
alias brewpr="brew services restart"
alias brewps="brew services start"
alias brewpx="brew services stop"
alias cat="bat"
alias cd="z"
alias cm="chezmoi"
alias cma="chezmoi add"
alias cmA="chezmoi apply -v"
alias cmcd="chezmoi cd"
alias cmm="chezmoi merge"
alias cmM="chezmoi merge-all"
alias cmls="chezmoi managed"
alias cmlS="chezmoi unmanaged"
alias cms="chezmoi status"
alias ez="exec zsh"
alias giaa="git add -A"
alias gpge="tmux switch-client -t home:gpg-cfg.2"
alias hosts="sudo nvim /etc/hosts && dscacheutil -flushcache"
alias ls="lsd"
alias md="mkdir -p"
alias nvime="tmux switch-client -t home:nvim-cfg.2"
alias r="ranger"
alias ranger="source ranger"
alias sa='print -z $(alias | fzf | awk -F '"'"'='"'"' '"'"'{ print $1 }'"'"') '
alias sshe="tmux switch-client -t home:ssg-cfg.2"
alias tx="tmux"
alias txa="tmux new-session -A"
alias txe="tmux switch-client -t home:tmux-cfg.2"
alias txls="tmux list-sessions"
alias txp="tmuxp"
alias txpe="tmux switch-client -t home:tmuxp-cfg.2"
alias txpl="tmuxp load -d"
alias txpL="tmuxp load"
alias zshe="tmux switch-client -t home:zsh-cfg.2"

#
# Suffix Aliases
#
alias -s {md,markdown,mkdwn}="glow -p"

