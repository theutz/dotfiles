# Options
#{{{
setopt auto_cd
setopt extended_glob
# }}}

# Vi Mode
#{{{
bindkey -v
export KEYTIMEOUT=1

# This fixes character deletion after using history
bindkey "^?" backward-delete-char
# }}}

# Plugins
#{{{
source $ZPLUG_HOME/init.zsh

zplug "wfxr/forgit"
zplug "ael-code/zsh-colored-man-pages", use:"*.plugin.zsh"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
# }}}

# Kitty
#{{{

# Must be loaded after `compinit`
kitty + complete setup zsh | source /dev/stdin
# }}}

# Starship
#{{{
eval "$(starship init zsh)"
# }}}

# FZF
#{{{
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# TMUX
#{{{

# Ensure Tmux Plugin Manager is installed.
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# }}}

# Emacs
# {{{

# Ensure Doom Emacs is installed.
if [[ ! -d ~/.emacs.d ]]; then
  git clone https://github.com/hlissner/doom-emacs.git ~/.emacs.d
fi
# }}}

# fasd
# {{{
eval "$(fasd --init auto)"
#}}}

# Aliases
#{{{
alias lg="lazygit"
alias e="${VISUAL:-EDITOR}"
alias en="e --no-wait"

# By sourcing ranger, we allow it to tell the shell to
# `cd` to the last opened directory.
alias rr="source ranger"
# }}}

# vim: fdm=marker fdl=0
