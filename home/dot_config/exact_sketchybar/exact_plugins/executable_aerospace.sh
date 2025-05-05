#!/usr/bin/env bash
set -euo pipefail

. "$CONFIG_DIR/colors.sh"

focused_workspace="$(aerospace list-workspaces --focused)"
all_workspaces="$(aerospace list-workspaces --all)"
workspaces_on_focused_monitor="$(
    aerospace list-workspaces --monitor focused --json |
        jq 'map(.workspace)'
)"

function is_on_focused_monitor() {
    jq --exit-status --arg w "$1" 'any(. == $w)' >/dev/null <<<"$workspaces_on_focused_monitor"
    return $?
}

function workspace_has_windows() {
    count="$(aerospace list-windows --workspace "$1" --count)"
    test "$count" -gt 0
    return $?
}

args=()

default_background="$(color -a 88 background)"
default_label="$(color pink)"
default_icon="$(color purple)"

for workspace in $all_workspaces; do
    args+=(--set space."$workspace")

    if [[ "$workspace" == "$focused_workspace" ]]; then
        args+=(
            background.color="$(color -a 66 green)"
            label.highlight_color="$(color green)"
            label.highlight=on
            background.drawing=on
        )
        if workspace_has_windows "$workspace"; then
            args+=(
                icon.highlight_color="$(color green)"
                icon.highlight=on
            )
        fi
        continue
    else
        args+=(
            background.color="$default_background"
            label.highlight_color="$default_label"
            icon.highlight_color="$default_icon"
            background.drawing=off
        )
    fi

    if is_on_focused_monitor "$workspace"; then
        args+=(
            label.highlight=on
            icon.highlight_color="$default_icon"
        )
    else
        args+=(
            label.highlight=off
            icon.highlight_color="$(color -a 66 purple)"
        )
    fi

    if workspace_has_windows "$workspace"; then
        args+=(
            icon.highlight=on
        )
    else
        args+=(
            icon.highlight=off
        )
    fi
done

sketchybar "${args[@]}"
