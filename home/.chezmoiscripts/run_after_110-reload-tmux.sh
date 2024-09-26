#!/usr/bin/env zsh

tmux source-file ~/.config/tmux/tmux.conf \; tmux display-message "Config reloaded by chezmoi!"
