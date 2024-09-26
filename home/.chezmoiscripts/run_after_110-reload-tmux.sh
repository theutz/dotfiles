#!/usr/bin/env zsh

tmux source-file ~/.config/tmux/tmux.conf \; \
  display-message "Config reloaded by chezmoi!"
