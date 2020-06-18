.PHONY: install uninstall

install:
	stow --verbose home

uninstall:
	stow --verbose --delete home
