# Setup keybindings
bindkey -v
bindkey '^_' undo

# Set options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt ALIASES

# Setup Prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit
promptinit
prompt pure

# Setup homebrew
eval "$(brew shellenv)"

# Setup GPG
export GPG_TTY="$(tty)"

# Setup Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
mkdir -p $GOPATH/{src,pkg,bin}

# Setup Unity Vault
export VAULT_ADDR='https://vault.corp.unity3d.com'

# Setup Google Cloud SDK
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then
  . "${HOME}/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then
  . "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

# Setup git completion
zstyle ':completion:*:*:git:*' script "${HOMEBREW_PREFIX}/share/zsh/site-functions/git-completion.bash"
fpath+="${HOMEBREW_PREFIX}/share/zsh/site-functions/_git"
autoload -Uz compinit && compinit
