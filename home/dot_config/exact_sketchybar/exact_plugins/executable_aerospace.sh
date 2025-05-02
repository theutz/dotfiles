#!/usr/bin/env bash

PATH="$HOME/bin:$PATH"

if [[ -z "$FOCUSED_WORKSPACE" ]]; then
    FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"
fi

args=("--set" "$NAME")

if [[ $(aerospace list-workspaces --monitor focused) =~ $1 ]]; then
    args+=(icon="•")
else
    args+=(icon=" ")
fi

if [[ "$1" = "$FOCUSED_WORKSPACE" ]]; then
    args+=(
        background.drawing=on
        icon.drawing=off
        label.color="$(dracula -s background)"
    )
else
    args+=(
        background.drawing=off
        icon.drawing=on
    )
    if [[ "$(aerospace list-windows --workspace "$1" --count)" -gt 0 ]]; then
        args+=(
            label.color="$(dracula -s foreground)"
        )
    else
        args+=(
            label.color="$(dracula -s comment)"
        )
    fi
fi

sketchybar "${args[@]}"
