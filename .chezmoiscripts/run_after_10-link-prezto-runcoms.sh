#!/usr/bin/env zsh

setopt EXTENDED_GLOB
for rcfile in "${ZPREZTODIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
