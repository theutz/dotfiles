#
# Aliases
#

alias aic="aicommits"
alias aliases="chezmoi edit -a ~/.config/zsh/aliases.zsh; exec zsh"
alias ans="ansible"
alias ansb="ansible-playbook"
alias ansi="ansible-inventory"
alias ansv="ansible-vault"
alias cm="chezmoi"
alias cma="chezmoi add"
alias cmA="chezmoi apply"
alias cmcd="chezmoi cd"
alias cmch="chezmoi chattr"
alias cme="chezmoi managed --path-style absolute | gum filter --fuzzy | xargs chezmoi edit"
alias cmea="chezmoi managed --path-style absolute | gum filter --fuzzy | xargs chezmoi edit -a"
alias cmf="chezmoi managed --path-style source-relative | gum filter | xargs chezmoi forget"
alias cmg="chezmoi git"
alias cmgs="chezmoi git status"
alias cmi="chezmoi init"
alias cmls="chezmoi managed ."
alias cmm="chezmoi status | cut -w -f3 | gum filter | xargs chezmoi merge"
alias cmma="chezmoi merge-all"
alias cmra="chezmoi re-add"
alias cmrm="chezmoi remove"
alias cms="chezmoi status"
alias cmu="chezmoi update"
alias cmur="chezmoi update --refresh-externals"
alias ez="exec zsh"
alias funcs="chezmoi edit -a ~/.config/zsh/funcs.zsh; exec zsh"
alias hosts="sudo nvim /etc/hosts && dscacheutil -flushcache"
alias lg="lazygit"
alias linlls="linode-cli linodes ls"
alias md="mkdir -p"
alias nve="chezmoi edit -a ~/.config/nvim"
alias r="ranger"
alias ranger="source ranger"
alias tx="tmux"
alias txe="chezmoi edit -a ~/.config/tmux/tmux.conf"
alias txks="tmux list-sessions -F '#S' 2>/dev/null | gum filter | xargs -I _ tmux kill-session -t _"
alias txls="tmux list-sessions"
alias txpl="tmuxp ls | gum filter | xargs tmuxp load -d"

if [[ "$OSTYPE" == darwin* ]]; then
  alias brewk="brew info"
  alias brewp="brew services"
  alias brewpr="brew services restart"
  alias brewps="brew services start"
  alias brewpx="brew services stop"
  alias caskk="brew info --cask"
fi

for rc in zshrc zpreztorc zshenv zlogin zlogout zprofile; do
  alias $rc="chezmoi edit -a $ZDOTDIR/.$rc"
done

#
# Suffix Aliases
#
alias -s {md,markdown,mkdwn}="glow -p"
alias -g P="| p"

