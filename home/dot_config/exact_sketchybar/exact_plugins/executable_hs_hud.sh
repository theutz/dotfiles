#!/usr/bin/env bash

# shellcheck source=colors.sh
source "$CONFIG_DIR/colors.sh"

if [[ -n "$LABEL" ]]; then
    drawing=on
    color="$(color 1 33)"
else
    color="$(color 0 33)"
    drawing=false
fi

sketchybar --bar color="$color" \
    --set "$NAME" drawing="$drawing" \
    label="$LABEL" \
    background.color="$(color 1 44)" \
    icon.color="$(color 1)" \
    label.color="$(color 1)"
