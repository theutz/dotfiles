# Setup keybindings
bindkey -v
bindkey '^_' undo

# Setup Prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit
promptinit
prompt pure

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
