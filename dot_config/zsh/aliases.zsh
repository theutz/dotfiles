# -------------
# -- Aliases --
# -------------

alias aic="aicommits"
alias aliases="(cd ~/.config/zsh && e aliases.zsh); ez"
alias ans="ansible"
alias ansb="ansible-playbook"
alias ansi="ansible-inventory"
alias ansv="ansible-vault"
alias cm="chezmoi"
alias cma="chezmoi add"
alias cmA="chezmoi apply"
alias cmcd="chezmoi cd"
alias cmch="chezmoi chattr"
alias cmd="chezmoi diff"
alias cme="chezmoi managed --path-style absolute | gum filter --fuzzy | xargs chezmoi edit"
alias cmea="chezmoi managed --path-style absolute | gum filter --fuzzy | xargs -I _ chezmoi edit -a _ && exec zsh"
alias cmf="chezmoi managed --path-style source-relative | gum filter | xargs chezmoi forget"
alias cmg="chezmoi git"
alias cmgs="chezmoi git status -- --short"
alias cmi="chezmoi init"
alias cmls="chezmoi managed ."
alias cmm="chezmoi status | cut -w -f3 | gum filter | xargs chezmoi merge"
alias cmma="chezmoi merge-all"
alias cmra="chezmoi re-add --interactive"
alias cmrm="chezmoi remove"
alias cms="chezmoi status"
alias cmu="chezmoi update"
alias cmur="chezmoi update --refresh-externals"
alias e="${(z)EDITOR:-nvim}"
alias ez="exec zsh"
alias funcs="(cd ~/.config/zsh && e funcs.zsh); ez"
alias hosts="sudo e /etc/hosts && dscacheutil -flushcache"
alias lg="lazygit"
alias linls="linode-cli linodes ls"
alias mkdir="mkdir -p"
alias vimrc='(cd ~/.config/nvim && e)'
alias r="ranger"
alias ranger="source ranger"
alias tx="tmux"
alias tmux.conf="(cd ~/.config/tmux && e)"
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
  alias $rc="(cd $ZDOTDIR && e .$rc); ez"
done

# --------------------
# -- Suffix Aliases --
# --------------------

alias -s {md,markdown,mkdwn}="glow -p"

# --------------------
# -- Global Aliases --
# --------------------

alias -g P="| p"
alias -g @noerr="2> /dev/null"
alias -g @noout="&> /dev/null"
