#!/usr/bin/env zsh

# .chezmoiexternals hash: {{ include ".chezmoiexternal.toml" | sha256sum }}

printf "\nLinking prezto runcoms...\n\n"

setopt EXTENDED_GLOB

for rcfile in "${ZPREZTODIR:-${ZDOTDIR:-${${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}/.zprezto}"/runcoms/^README.md(.N); do
  from="$rcfile"
  to="${ZDOTDIR:-${${XDG_CONFIG_HOME:-$HOME/.config}/zsh}}/.${rcfile:t}"

  printf '%s -> %s\n' $from $to

  ln -sf $from $to
done

# vim: ft=tmpl.zsh
