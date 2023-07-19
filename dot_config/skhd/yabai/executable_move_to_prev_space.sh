#!/usr/bin/env bash

if [[ "$(yabai -m query --spaces --display | jq '. | length')" == "1" ]]; then
  yabai -m space --create
fi

if yabai -m window --space prev; then
  yabai -m space --focus prev
elif yabai -m window --space last; then
  yabai -m space --focus last
fi
