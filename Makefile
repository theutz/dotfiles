# Make Setup {{{
SHELL = /bin/sh
.PHONY: all clean install init uninstall
#}}}

# Stow Setup {{{
STOW = stow --dir layouts --target ${HOME} --verbose
UNSTOW = ${STOW} --delete
LAYOUTS = bash bin emacs git
#}}}

# Make Targets
all: install
clean: uninstall

install: init
	@echo "Installing Dotfiles..."
	@for item in ${LAYOUTS}; do \
	  ${STOW} $$item; \
	done

init:
	@echo "Setting up git hooks..."
	@git config core.hooksPath hooks

uninstall:
	@echo "\nUninstalling Dotfiles..."
	@for item in ${LAYOUTS}; do \
	  ${UNSTOW} $$item; \
	done;

# vim: fdm=marker fdl=0
