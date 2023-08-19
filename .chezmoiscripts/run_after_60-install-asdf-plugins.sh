#!/bin/zsh

plugins=(
	nodejs
	ruby
	python
  yarn
  pnpm
)

installed=("${(@f)$(asdf plugin list)}")

foreach plugin in $plugins
do
  if [[ -z $installed[(r)$plugin] ]]
  then
    asdf plugin add $plugin
  fi
done

asdf install
