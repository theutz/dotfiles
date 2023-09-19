#!/usr/bin/env zsh

for rcfile in "${ZPREZTODIR}"/runcoms/^README.md(.N); do
  ln -sf $rcfile "${ZDOTDIR}/.${rcfile:t}"
done
