#!/usr/bin/env bash
set -euo pipefail

. "$CONFIG_DIR/colors.sh"

MODE="$(aerospace list-modes --current)"

sketchybar=(
    --set aerospace.mode
    label="${MODE^^}"
)

borders=()

case "$MODE" in
main)
    sketchybar+=(
        drawing=off
    )
    borders+=(
        active_color="$(color pink)"
        inactive_color="$(color -a 88 purple)"
    )
    ;;
*)
    sketchybar+=(
        drawing=on
        icon.color="$(color red)"
        label.color="$(color orange)"
    )
    borders+=(
        active_color="$(color red)"
        inactive_color="$(color red -a 33)"
    )
    ;;
esac

borders "${borders[@]}" &
sketchybar "${sketchybar[@]}" &
