#!/bin/zsh

if ! command -v asdf &>/dev/null; then
  exec zsh
fi

plugins=(
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
