SHELL := /bin/bash

.PHONY: install \
	clean \
	stow-home \
	unstow-home \
	link-org-files \
	clean-org-files \
	desktop-icons-off \
	desktop-icons-on \
	install-chemacs \
	clean-chemacs

# Primary Commands

install: stow-home \
	desktop-icons-off \
	link-org-files \
	install-chemacs

clean: unstow-home \
	desktop-icons-on \
	clean-org-files \
	clean-chemacs

# Stow

stow-home:
	@echo "Stowing dotfiles..."
	@stow --verbose home
	@echo "Done."

unstow-home:
	@echo "Un-stowing dotfiles..."
	@stow --verbose --delete home
	@echo "Done."

# Desktop Icons

desktop-icons-off:
	@echo
	@echo "Turning off desktop icons..."
	@defaults write com.apple.finder CreateDesktop false
	@killall Finder
	@echo "Done."

desktop-icons-on:
	@echo
	@echo "Turning on desktop icons..."
	@defaults write com.apple.finder CreateDesktop true
	@killall Finder
	@echo "Done."

# Org Files

ACTUAL_ORG_FILES=${HOME}/Dropbox/org
ORG_DIRECTORY=${HOME}/org

link-org-files:
	@echo
	@echo "Linking org files..."
	@rm -rf $(ORG_DIRECTORY)
	@if [ -d $(ACTUAL_ORG_FILES) ]; then \
		ln -s $(ACTUAL_ORG_FILES) $(ORG_DIRECTORY); \
		echo "Done."; \
	else \
		echo "Org files directory doesn't exist."; \
	fi

clean-org-files:
	@echo
	@echo "Cleaning org files..."
	@rm -rf $(ORG_DIRECTORY)
	@echo "Done."

# Chemacs

CHEMACS_FILE=.emacs
CHEMACS_SRC=${PWD}/chemacs/$(CHEMACS_FILE)
CHEMACS_DEST=${HOME}

install-chemacs:
	@echo
	@echo "Installing Chemacs..."
	@if [ ! -a $(CHEMACS_SRC) ]; then \
		ln -s $(CHEMACS_SRC) $(CHEMACS_DEST); \
		echo "Done."; \
	else \
		echo "Chemacs script does not exist."; \
	fi

clean-chemacs:
	@echo
	@echo "Uninstalling Chemacs..."
	@rm -rf $(CHEMACS_DEST)/$(CHEMACS_FILE)
	@echo "Done."
