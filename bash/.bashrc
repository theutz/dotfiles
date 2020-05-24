# FZF {{{
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#}}}

# GPG {{{
GPG_TTY=$(tty)
export GPG_TTY
#}}}

# Broot {{{
source $HOME/Library/Preferences/org.dystroy.broot/launcher/bash/br
#}}}

# NVIM {{{
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#}}}

# nostromo [section begin] {{{
eval "$(nostromo completion)"
# nostromo [section end] }}}

# z {{{
source /usr/local/etc/profile.d/z.sh
#]}}

# vim: fdm=marker fdl=0
