#!/usr/bin/env bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

args=(
    --animate quadratic 30
    --set "$NAME"
)

if [[ "$SENDER" = "front_app_switched" ]]; then
    args+=(
        label="$INFO"
    )
fi

sketchybar "${args[@]}"
