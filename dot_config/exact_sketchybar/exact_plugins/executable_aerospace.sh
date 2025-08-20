#!/usr/bin/env bash
set -euo pipefail

. "$CONFIG_DIR/colors.sh"

focused_workspace="$(aerospace list-workspaces --focused)"
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

for workspace in $(aerospace list-workspaces --all); do
    args+=(
        --animate quadratic 15
        --set space."$workspace"
    )

    if [[ "$workspace" == "$focused_workspace" ]]; then
        args+=(
            icon.highlight=on
            label.highlight=on
            background.drawing=on
        )
    else
        args+=(
            icon.highlight=off
            background.drawing=off
            label.highlight=off
        )
    fi

    if is_on_focused_monitor "$workspace"; then
        args+=(
            icon.highlight=on
        )
    else
        args+=(
            icon.highlight=off
        )
    fi

    if workspace_has_windows "$workspace"; then
        args+=(
            label.drawing=on
            icon.padding_right="$(sketchybar --query defaults |
                jq -r '.icon.padding_right')"
        )
    else
        args+=(
            label.drawing=off
            icon.padding_right=12
        )
    fi
done

if [[ "$(aerospace list-monitors --count)" -gt 1 ]]; then
    args+=(
        --set spotify position=center
        --set ipaddress position=center
        --set iplocation position=center
    )
else
    args+=(
        --set spotify position=q
        --set ipaddress position=e
        --set iplocation position=e
    )
fi

sketchybar "${args[@]}"
