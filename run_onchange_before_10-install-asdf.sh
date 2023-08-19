#!/bin/zsh

set -euo pipefail

echo "== asdf =="
echo "Ensuring asdf command exists..."
if command -v asdf &>/dev/null; then
	echo "Command exists!"
else
	echo "Loading asdf..."
	. "$HOME/.asdf/asdf.sh"
fi

echo "Adding asdf plugins..."

plugins=(
	nodejs
	ruby
	python
)

for plugin in $plugins; do
	echo "Adding $plugin"
	asdf plugin add $plugin || continue
	echo "$plugin added!"
done
