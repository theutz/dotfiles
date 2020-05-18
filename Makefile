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
  install-tmux \
  install-topgrade \
  install-vim \
  install-zsh

uninstall: clean
clean: \
  clean-bash \
  clean-bin \
  clean-git \
  clean-homebrew \
  clean-htop \
  clean-tmux \
  clean-topgrade \
  clean-vim \
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

# zsh {{{
install-zsh:
	${stow} zsh
clean-zsh:
	${unstow} zsh
#}}}
#}}}
