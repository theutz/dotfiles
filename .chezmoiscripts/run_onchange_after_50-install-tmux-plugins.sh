#!/usr/bin/env zsh

# tmux.conf hash: {{ include "dot_config/tmux/tmux.conf" | sha256sum }}

printf "\nInstalling tmux plugins...\n\n"

~/.config/tmux/plugins/tpm/bin/install_plugins

if [[ -n "$TMUX" ]]; then
  printf "\nReloading tmux config\n\n"
  tmux source-file ~/.config/tmux/tmux.conf
  tmux display-message "#[fg=default bg=green fill=green] Plugins installed and config reloaded by #[italics]chezmoi"
fi

echo
