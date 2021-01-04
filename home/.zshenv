# Editors
# {{{
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient --tty"
export VISUAL="emacsclient --create-frame"
export PAGER="less"
# }}}

# Language
# {{{
if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
fi
# }}}

# Paths
# {{{

# Ensure that paths arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
    usr/local/{bin,sbin}
    $HOME/bin
    $HOME/.emacs.d/bin
    $path
)
# }}}

# Less
# {{{

# Set the default Less options.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
    export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
# }}}

# TERM
# {{{
if [[ $TERM =~ '^eterm' ]]; then
    export PROMPT_EOL_MARK=''
else
    export TERM="xterm-256color"
fi
# }}}

# Zplug
# {{{
export ZPLUG_HOME=/usr/local/opt/zplug
# }}}

# Ubar
# {{{
export UBAR_MODE_FILE="${HOME}/.ubar/mode"
#}}}

# vim: fdm=marker fdl=0
