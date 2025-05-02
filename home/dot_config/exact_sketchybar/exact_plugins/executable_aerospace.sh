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
    echo "$workspaces_on_focused_monitor" |
        jq --exit-status --arg w "$1" 'any(. == $w)' >/dev/null
    return $?
}

function workspace_has_windows() {
    count="$(aerospace list-windows --workspace "$1" --count)"
    if [[ "$count" -gt 0 ]]; then
        return 0
    else
        return 1
    fi
}

args=()

for workspace in $all_workspaces; do
    args+=(
        --set
        space."$workspace"
    )

    if [[ "$workspace" == "$focused_workspace" ]]; then
        args+=(
            background.drawing=on
            # label.highlight=on
            # icon.highlight=on
        )
    else
        args+=(
            background.drawing=off
        )
    fi

    if is_on_focused_monitor "$workspace"; then
        args+=(
            label.highlight=on
        )
    else
        args+=(
            label.highlight=off
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
