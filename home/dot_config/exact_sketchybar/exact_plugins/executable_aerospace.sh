#!/usr/bin/env bash

set -euo pipefail

PATH="$HOME/bin:$PATH"

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

fg="$(dracula -s foreground)"
green="$(dracula -s green)"
comment="$(dracula -s comment)"

args=()

for workspace in $all_workspaces; do
    args+=(
        --set
        space."$workspace"
    )

    if [[ "$workspace" == "$focused_workspace" ]]; then
        args+=(
            background.drawing=on
            icon="•"
            label.color="$fg"
            icon.color="$green"
        )
        continue
    fi

    args+=(
        background.drawing=off
        icon.color="$comment"
    )

    if is_on_focused_monitor "$workspace"; then
        args+=(
            label.color="$fg"
            icon.color="$comment"
        )
    else
        args+=(
            label.color="$comment"
        )
    fi

    if workspace_has_windows "$workspace"; then
        args+=(
            icon="•"
        )
    else
        args+=(
            icon=" "
        )
    fi
done

sketchybar "${args[@]}"
