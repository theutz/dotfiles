#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spawn WezTerm
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👾
# @raycast.packageName com.theutz.spawn-wezterm

# Documentation:
# @raycast.description Spawn a new instance of WezTerm
# @raycast.author theutz
# @raycast.authorURL https://raycast.com/theutz

wezterm \
  --config quit_when_all_windows_are_closed=true \
  start -- &>/dev/null &
