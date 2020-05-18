#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER='less'

#
# Less
#

export LESS='-F -g -i -M -R -S -w -X -z-4'

#
# FZF Setup
#

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
