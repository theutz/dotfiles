# dP                         dP                         
# 88                         88                         
# 88d888b. .d8888b. .d8888b. 88d888b. 88d888b. .d8888b. 
# 88'  `88 88'  `88 Y8ooooo. 88'  `88 88'  `88 88'  `"" 
# 88.  .88 88.  .88       88 88    88 88       88.  ... 
# 88Y8888' `88888P8 `88888P' dP    dP dP       `88888P' 
#                                                       
#                                                       

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

# starship {{{
eval "$(starship init bash)"
#}}}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.{{{
export PATH="$PATH:$HOME/.rvm/bin"
#}}}

# vim: fdm=marker fdl=0
