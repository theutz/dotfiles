#
# Editors
#
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

#
# Language
#
if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure that paths arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
	/usr/local/{bin,sbin}
	$HOME/bin
	$HOME/.emacs.d/bin
	$path
)
