#
# Aliases
#

alias aic="aicommits"
alias aliases="chezmoi edit -a ~/.config/zsh/aliases.zsh"
alias ans="ansible"
alias ansb="ansible-playbook"
alias ansi="ansible-inventory"
alias ansv="ansible-vault"
alias brewk="brew info"
alias brewp="brew services"
alias brewpr="brew services restart"
alias brewps="brew services start"
alias brewpx="brew services stop"
alias cm="chezmoi"
alias caskk="brew info --cask"
alias funcs="chezmoi edit -a ~/.config/zsh/funcs.zsh"
alias hosts="sudo nvim /etc/hosts && dscacheutil -flushcache"
alias lll="linode-cli linodes ls"
alias r="ranger"
alias ranger="source ranger"

for rc in zshrc zpreztorc zshenv zlogin zlogout zprofile; do
  alias $rc="chezmoi edit -a $rc"
done

#
# Suffix Aliases
#
alias -s {md,markdown,mkdwn}="glow -p"

