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
alias cma="cm add --interactive"
alias cmA="cm apply --interactive"
alias cmcd="cm cd"
alias cmch="cm chattr"
alias cmd="cm diff"
alias cme="cm managed --path-style absolute | gum filter --fuzzy | xargs chezmoi edit"
alias cmea="cm managed --path-style absolute | gum filter --fuzzy | xargs -I _ chezmoi edit -a _ && exec zsh"
alias cmf="cm managed --path-style source-relative | gum filter | xargs chezmoi forget"
alias cmg="cm git"
alias cmgs="cm git status -- --short"
alias cmi="cm init"
alias cmls="cm managed"
alias cmm="cm status | cut -w -f3 | gum filter | xargs chezmoi merge"
alias cmma="cm merge-all"
alias cmra="cm re-add --interactive"
alias cmrm="cm remove"
alias cms="cm status"
alias cmu="cm update"
alias cmur="cm update --refresh-externals"
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
alias skhdrc="e ~/.config/skhd/skhdrc"
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
