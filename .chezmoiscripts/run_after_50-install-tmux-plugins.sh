#!/usr/bin/env zsh

~/.config/tmux/plugins/tpm/bin/install_plugins
tmux source-file ~/.config/tmux/tmux.conf
tmux display-message "#[fg=default bg=green fill=green] Plugins installed and config reloaded by #[italics]chezmoi"
