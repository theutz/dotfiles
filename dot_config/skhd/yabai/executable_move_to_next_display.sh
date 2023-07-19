#!/usr/bin/env bash

win="$(yabai -m query --windows --window | jq '.id')"

if yabai -m window --display next; then
  yabai -m display --focus next
elif yabai -m window --display first; then
  yabai -m display --focus first
fi
yabai -m window --focus $win
