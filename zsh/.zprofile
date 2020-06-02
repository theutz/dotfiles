#                                     .8888b oo dP          
#                                     88   "    88          
# d888888b 88d888b. 88d888b. .d8888b. 88aaa  dP 88 .d8888b. 
#    .d8P' 88'  `88 88'  `88 88'  `88 88     88 88 88ooood8 
#  .Y8P    88.  .88 88       88.  .88 88     88 88 88.  ... 
# d888888P 88Y888P' dP       `88888P' dP     dP dP `88888P' 
#          88                                               
#          dP                                               

# Browser {{{
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi
#}}}

# Editors {{{
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER='less'
#}}}

# Language {{{
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
#}}}

# Paths {{{
# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)
#}}}

# Less {{{
# Set the default Less options
export LESS='-F -g -i -M -R -S -w -X -z-4'
# Set the Less input preprocessor
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
#}}}

# Dotfiles Setup {{{
export DOTFILES_DIR="${HOME}/.dotfiles"
#}}}

# vim: fdm=marker fdl=0
