[ -f ~/.fzf.bash ] && source ~/.fzf.bash

GPG_TTY=$(tty)
export GPG_TTY

source /Users/michael.utz/Library/Preferences/org.dystroy.broot/launcher/bash/br

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
