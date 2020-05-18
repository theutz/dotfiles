# vim: fdm=marker fdl=0
# Setup Zplug {{{
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh
#}}}

# Essential ZSH Options {{{
bindkey -v
# }}}

# List plugins to install
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "modules/git", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/docker", from:prezto
zplug "modules/utility", from:prezto
zplug "djui/alias-tips"
zplug "junegunn/fzf", \
 hook-build:"\"$ZPLUG_REPOS\"/junegunn/fzf/install --key-bindings --completion --no-update-rc"
zplug "dracula/zsh", as:theme

# Install and Load Plugins {{{
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi
zplug load
# }}}

# FZF Setup {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}
