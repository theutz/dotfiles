#!/usr/bin/env bash

PATH="$HOME/bin:$PATH"

if [[ -z "$FOCUSED_WORKSPACE" ]]; then
    FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"
fi

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
        background.drawing=on \
        "label.color=$(dracula -s background)"
else
    sketchybar --set $NAME background.drawing=off \
        "label.color=$(dracula -s foreground)"
fi
