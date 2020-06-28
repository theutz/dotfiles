.PHONY: install uninstall
SHELL := /bin/bash

ACTUAL_ORG_FILES=${HOME}/Library/Mobile\ Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org
ORG_DIRECTORY=${HOME}/org

install:
	stow --verbose home
	rm -rf $(ORG_DIRECTORY)
	if [ -d $(ACTUAL_ORG_FILES) ]; then \
		ln -s $(ACTUAL_ORG_FILES) $(ORG_DIRECTORY); \
	fi

uninstall:
	stow --verbose --delete home
	rm -rf $(ORG_DIRECTORY)
