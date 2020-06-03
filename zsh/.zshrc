#                      dP                         
#                      88                         
#    d888888b .d8888b. 88d888b. 88d888b. .d8888b. 
#       .d8P' Y8ooooo. 88'  `88 88'  `88 88'  `"" 
# dP  .Y8P          88 88    88 88       88.  ... 
# 88 d888888P `88888P' dP    dP dP       `88888P' 
#                                                 
#                                                 

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
source "${DOTFILES_DIR}/zsh/.zpreztorc"
# }}}

# List plugins to install {{{
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Prezto {{{
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
zplug "modules/tmux", from:prezto
zplug "modules/prompt", from:prezto
# }}}

# Oh My Zsh {{{
zplug "plugins/colored-man-pages", from:oh-my-zsh
# }}}

# Other {{{
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"
zplug "djui/alias-tips"
zplug "junegunn/fzf", \
 hook-build:"\"$ZPLUG_REPOS\"/junegunn/fzf/install --key-bindings --completion --no-update-rc"
zplug "wfxr/forgit"
#}}}

# Local {{{
zplug "~/.zsh", from:local, use:"**/init.zsh"
zplug "~/.zsh", from:local, use:"**/after.zsh", defer:2
#}}}
#}}}

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

# vim: fdm=marker fdl=0
