SHELL := /bin/bash

.PHONY: install \
	clean \
	stow-home \
	unstow-home \
	link-org-files \
	clean-org-files \
	desktop-icons-off \
	desktop-icons-on

# Primary Commands

install: stow-home \
	desktop-icons-off \
	link-org-files

clean: unstow-home \
	desktop-icons-on \
	clean-org-files

# Stow
stow-home: 
	stow --verbose home

unstow-home:
	stow --verbose --delete home

# Desktop Icons

desktop-icons-off:
	defaults write com.apple.finder CreateDesktop false
	killall Finder

desktop-icons-on:
	defaults write com.apple.finder CreateDesktop true
	killall Finder

# Org Files

ACTUAL_ORG_FILES=${HOME}/Dropbox/org
ORG_DIRECTORY=${HOME}/org

link-org-files:
	rm -rf $(ORG_DIRECTORY)
	if [ -d $(ACTUAL_ORG_FILES) ]; then \
		ln -s $(ACTUAL_ORG_FILES) $(ORG_DIRECTORY); \
	fi

clean-org-files:
	rm -rf $(ORG_DIRECTORY)
