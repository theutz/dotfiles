#!/usr/bin/env bash
set -euo pipefail

. "$CONFIG_DIR/colors.sh"

MODE="$(aerospace list-modes --current)"

args=("--set" "aerospace.mode" "label=${MODE^^}")

case "$MODE" in
focus | move)
    args+=(
        icon.color="$(color red)"
        label.color="$(color orange)"
    )
    borders active_color="$(color red)" inactive_color="$(color red -a 33)"
    ;;
esac

if [[ "$MODE" == main ]]; then
    args+=("drawing=off")
    borders active_color="$(color cyan)" inactive_color="$(color -a 88 background)"
else
    args+=("drawing=on")
fi

sketchybar "${args[@]}"
