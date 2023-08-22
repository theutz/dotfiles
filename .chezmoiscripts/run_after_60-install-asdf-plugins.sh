#!/bin/zsh

set -euo pipefail

if ! command -v asdf &>/dev/null; then
  exec zsh
fi

plugins=(
  direnv
	nodejs
	ruby
	python
  yarn
  pnpm
  pipx
)

foreach plugin in $plugins; do
  asdf plugin add $plugin || continue
done

asdf install
