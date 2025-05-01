#!/usr/bin/env bash

MESSAGE="${LABEL:-Hammerspoon reloaded!}"
DURATION="${DURATION:-5}"

source "$CONFIG_DIR/colors.sh"

sketchybar --set "$NAME" drawing=on \
    label="$MESSAGE" \
    background.color="$(color 2 44)" \
    label.color="$(color 10)"

sleep "$DURATION"

sketchybar --animate quadratic 60 \
    --set "$NAME" background.color=0x0000000 \
    label.color=0x0000000

sleep 0.5

sketchybar --set "$NAME" drawing=off \
    label=""
