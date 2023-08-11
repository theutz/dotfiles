#!/bin/zsh

set -euo pipefail

echo "== asdf =="
if [ ! -d ~/.asdf ]; then
	echo "Installing asdf..."
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
fi

echo "asdf installed!"

echo "Ensuring asdf command exists..."
if command -v asdf &>/dev/null; then
	echo "Command exists!"
else
	echo "Loading asdf..."
	. "$HOME/asdf/asdf.sh"
fi

echo "Adding asdf plugins..."

plugins=(
	neovim
	nodejs
	ruby
	python
	tmux
)

for plugin in $plugins; do
	echo "Adding $plugin"
	asdf plugin add $plugin || continue
	echo "$plugin added!"
done
