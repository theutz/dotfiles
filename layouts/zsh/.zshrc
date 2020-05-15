# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# List plugins to install
zplug "zsh-users/zsh-syntax-highlighting"
zplug "modules/git", from:prezto
zplug "djui/alias-tips"
zplug "dracula/zsh", as:theme

# Install unloaded plugins
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Load all plugins
zplug load

# Install and load Starship
if ! type "starship" > /dev/null; then
  brew install starship
fi

eval "$(starship init zsh)"

