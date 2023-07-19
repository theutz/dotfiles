#!/usr/bin/env bash

win="$(yabai -m query --windows --window | jq '.id')"

if [[ "$(yabai -m query --spaces --display | jq '. | length')" == 1 ]]; then
  yabai -m space --create
fi

if ! yabai -m window --space prev; then
  yabai -m window --space last
fi
yabai -m window --focus $win
