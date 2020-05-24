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

# Prezto Configuration {{{
zstyle ':prezto:*:*' case-sensitive 'yes'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' ps-context 'yes'
zstyle ':prezto:module:git:status:ignore' submodules 'none'
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'
zstyle ':prezto:module:syntax-highlighting' styles \
  'builtin' 'bg=blue' \
  'command' 'bg=blue' \
  'function' 'bg=blue'
zstyle ':prezto:module:syntax-highlighting' pattern \
  'rm*-rf*' 'fg=white,bold,bg=red'
zstyle ':prezto:module:utility' safe-ops 'yes'
# }}}

# List plugins to install
zplug "zplug/zplug", hook-build:"zplug --self-manage"
# prezto {{{
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/git", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/docker", from:prezto
# }}}
# oh-my-zsh {{{
zplug "plugins/colored-man-pages", from:oh-my-zsh
# }}}
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"
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

# nostromo [section begin] {{{
eval "$(nostromo completion)"
# nostromo [section end] }}}
