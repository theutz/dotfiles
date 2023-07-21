#!/usr/bin/env bash

win="$(yabai -m query --windows --window | jq '.id')"

if yabai -m window --display prev; then
  yabai -m display --focus prev
elif yabai -m window --display last; then
  yabai -m display --focus last
fi
yabai -m window --focus $win
