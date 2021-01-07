#!/usr/bin/env zsh

__query_windows() {
    local result="$(yabai -m query --windows --window 2>/dev/null)"

    if [[ "$?" -eq 0 ]]; then
        echo $result
    else
        echo "\{}"
    fi
}

__query_spaces() {
    local result="$(yabai -m query --spaces 2>/dev/null)"

    if [[ "$?" -eq 0 ]]; then
        echo $result
    else
        echo "\{}"
    fi
}

__query_space() {
    local result="$(yabai -m query --spaces --space 2>/dev/null)"

    if [[ "$?" -eq 0 ]]; then
        echo $result
    else
        echo "\{}"
    fi
}

WINDOW="$(__query_windows)"
SPACES="$(__query_spaces)"
SPACE="$(__query_space)"

SPACE_INDEX="$(__query_space | jq '.index?')"
SPACE_COUNT="$(__query_spaces | jq '[.[]] | length')"
DISPLAY_INDEX="$(yabai -m query --displays --display | jq '.index?')"
DISPLAY_COUNT="$(yabai -m query --displays | jq 'length // 1')"
SKHD_MODE="$(cat $UBAR_MODE_FILE)"
WINDOW_SPLIT="$(echo $WINDOW | jq '.split? // null')"
WINDOW_FLOATING="$(echo $WINDOW | jq '.floating? // null')"
WINDOW_STICKY="$(echo $WINDOW | jq '.sticky? // null')"
WINDOW_ZOOM="$(echo $WINDOW | jq 'if .["zoom-parent"]? == 1 then "zoom-parent" elif .["zoom-fullscreen"]? == 1 then "zoom-fullscreen" else "none" end')"

echo $(cat <<-EOF
{
    "window": {
        "floating": $WINDOW_FLOATING,
        "sticky": $WINDOW_STICKY,
        "split": $WINDOW_SPLIT,
        "zoom": $WINDOW_ZOOM
    },
    "space": {
        "index": $SPACE_INDEX,
        "count": $SPACE_COUNT
    },
    "spaces": $SPACES,
    "display": {
        "index": $DISPLAY_INDEX,
        "count": $DISPLAY_COUNT
    },
    "skhd": {
        "mode": "$SKHD_MODE"
    }
}
EOF
)
