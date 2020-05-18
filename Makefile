# vim: fdm=marker fdl=1

.PHONY: all clean install uninstall
stow=stow --verbose
unstow=${stow} --delete

# Make Targets {{{
all: install
install: \
  install-bash \
  install-git \
  install-htop \
  install-starship \
  install-vim \
  install-bin \
  install-homebrew \
  install-topgrade \
  install-zsh

uninstall: clean
clean: \
  clean-bash \
  clean-git \
  clean-htop \
  clean-starship \
  clean-vim \
  clean-bin \
  clean-homebrew \
  clean-topgrade \
  clean-zsh

# bash {{{
install-bash:
	${stow} bash
clean-bash:
	${unstow} bash
#}}}

# git {{{
install-git:
	${stow} git
clean-git:
	${unstow} git
#}}}

# htop {{{
install-htop:
	${stow} htop
clean-htop:
	${unstow} htop
#}}}

# starship {{{
install-starship:
	${stow} starship
clean-starship:
	${unstow} starship
#}}}

# vim {{{
install-vim:
	${stow} vim
clean-vim:
	${unstow} vim
#}}}

# bin {{{
install-bin:
	${stow} bin
clean-bin:
	${unstow} bin
#}}}

# homebrew {{{
install-homebrew:
	${stow} homebrew
clean-homebrew:
	${unstow} homebrew
#}}}

# topgrade {{{
install-topgrade:
	${stow} topgrade
clean-topgrade:
	${unstow} topgrade
#}}}

# zsh {{{
install-zsh:
	${stow} zsh
clean-zsh:
	${unstow} zsh
#}}}
#}}}
