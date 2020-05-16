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
