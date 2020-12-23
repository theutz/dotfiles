# Editors
#{{{
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
# }}}

# Language
#{{{
if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi
# }}}

# Paths
#{{{

# Ensure that paths arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
	/usr/local/{bin,sbin}
	$HOME/bin
	$HOME/.emacs.d/bin
	$path
)
# }}}

# Less
#{{{

# Set the default Less options.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
	export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
# }}}

# TERM
#{{{
if [[ $TERM =~ '^eterm' ]]; then
	export PROMPT_EOL_MARK=''
else
	export TERM="xterm-256color"
fi
# }}}

# Vi Mode
#{{{
bindkey -v
export KEYTIMEOUT=1
# }}}

# Plugins
#{{{
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "wfxr/forgit"

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load --verbose
# }}}

# Kitty
#{{{

# Must be loaded after `compinit`
kitty + complete setup zsh | source /dev/stdin
# }}}

# Starship
#{{{
eval "$(starship init zsh)"
# }}}

# FZF
#{{{
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# TMUX
#{{{

# Ensure Tmux Plugin Manager is installed.
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# }}}

# Aliases
#{{{
alias lg="lazygit"
alias rr="ranger"
# }}}

# vim: fdm=marker fdl=0
