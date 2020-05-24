# vim: fdm=marker fdl=1

.PHONY: all clean install uninstall
stow=stow --verbose
unstow=${stow} --delete
tpm-dir:=${HOME}/.tmux/plugins/tpm

# Make Targets {{{
all: install
install: \
  install-bash \
  install-bin \
  install-git \
  install-homebrew \
  install-htop \
  install-node \
  install-tmux \
  install-topgrade \
  install-vim \
  install-yarn \
  install-zsh

uninstall: clean
clean: \
  clean-bash \
  clean-bin \
  clean-git \
  clean-homebrew \
  clean-htop \
  clean-node \
  clean-tmux \
  clean-topgrade \
  clean-vim \
  clean-yarn \
  clean-zsh

# bash {{{
install-bash:
	${stow} bash
clean-bash:
	${unstow} bash
#}}}

# bin {{{
install-bin:
	${stow} bin
clean-bin:
	${unstow} bin
#}}}

# git {{{
install-git:
	${stow} git
clean-git:
	${unstow} git
#}}}

# homebrew {{{
install-homebrew:
	${stow} homebrew
clean-homebrew:
	${unstow} homebrew
#}}}

# htop {{{
install-htop:
	${stow} htop
clean-htop:
	${unstow} htop
#}}}

# node {{{
install-node:
	${stow} node
clean-node:
	${unstow} node
#}}}

# tmux {{{
install-tmux:
	if [[ ! -d ${tpm-dir} ]]; then \
	  git clone https://github.com/tmux-plugins/tpm ${tpm-dir}; \
	fi
	${stow} tmux
clean-tmux:
	${unstow} tmux
# }}}

# topgrade {{{
install-topgrade:
	${stow} topgrade
clean-topgrade:
	${unstow} topgrade
#}}}

# vim {{{
install-vim:
	${stow} vim
clean-vim:
	${unstow} vim
#}}}

# yarn {{{
install-yarn:
	${stow} yarn
clean-yarn:
	${unstow} yarn
#}}}

# zsh {{{
install-zsh:
	${stow} zsh
clean-zsh:
	${unstow} zsh
#}}}
#}}}
