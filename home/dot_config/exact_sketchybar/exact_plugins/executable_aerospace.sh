#!/usr/bin/env bash

PATH="$HOME/bin:$PATH"

if [[ -z "$FOCUSED_WORKSPACE" ]]; then
    FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"
fi

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
        background.drawing=on \
        label.color="$(dracula -s background)" \
        label.padding_left=8 \
        label.padding_right=8
else
    sketchybar --set $NAME background.drawing=off \
        label.color="$(dracula -s foreground)" \
        label.padding_left=0 \
        label.padding_right=0
fi
