# .8888b          .8888b 
# 88   "          88   " 
# 88aaa  d888888b 88aaa  
# 88        .d8P' 88     
# 88      .Y8P    88     
# dP     d888888P dP     
#                        
#                        

fzf_args="--type f --hidden --follow --exclude .git --color=always"

if [[ $OSTYPE == linux-gnu ]]; then
  alias fd=fdfind
  export FZF_DEFAULT_COMMAND="fdfind $fzf_args"
else
  export FZF_DEFAULT_COMMAND="fd $fzf_args"
fi

export FZF_DEFAULT_OPTS="--ansi"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
