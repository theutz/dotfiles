#!/usr/bin/env bash

win="$(yabai -m query --windows --window | jq '.id')"

if ! yabai -m window --space next; then
  yabai -m space --create && yabai -m window --space next
fi

yabai -m window --focus $win
