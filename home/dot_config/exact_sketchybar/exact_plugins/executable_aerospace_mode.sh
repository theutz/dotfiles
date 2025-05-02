#!/usr/bin/env bash
set -euo pipefail

PATH="$HOME/bin:$PATH"

if [[ ! -v MODE || -z "$MODE" ]]; then
    MODE="$(aerospace list-modes --current)"
fi

args=(
    "--set"
    "aerospace.mode"
    "label=${MODE^^}"
)

case "$MODE" in
power)
    args+=(
        "icon.color=$(dracula -s red)"
        "label.color=$(dracula -s orange)"
    )
    borders active_color="$(dracula -s red)" inactive_color="$(dracula -s orange)"
    ;;
esac

if [[ "$MODE" == main ]]; then
    args+=("drawing=off")
    source "$HOME/.config/borders/bordersrc"
else
    args+=("drawing=on")
fi

sketchybar "${args[@]}"
