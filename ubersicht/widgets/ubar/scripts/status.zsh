#!/usr/bin/env zsh

__query_windows() {
    local result="$(yabai -m query --windows --window 2>/dev/null)"

    if [[ "$?" -eq 0 ]]; then
        echo $result
    fi
}

SPACE_INDEX="$(yabai -m query --spaces --space | jq .index)"
SPACE_COUNT="$(yabai -m query --spaces | jq '[ .[] | select(.display | contains(1)) ] | length')"
DISPLAY_INDEX="$(yabai -m query --displays --display | jq .index)"
DISPLAY_COUNT="$(yabai -m query --displays | jq length)"
SKHD_MODE="$(cat $UBAR_MODE_FILE)"
WINDOW_SPLIT="$(__query_windows | jq '.split? // null')"
WINDOW_FLOATING="$(__query_windows | jq '.floating? // null')"
WINDOW_STICKY="$(__query_windows | jq '.sticky? // null')"
WINDOW_ZOOM="$(__query_windows | jq 'if .["zoom-parent"]? == 1 then "zoom-parent" elif .["zoom-fullscreen"]? == 1 then "zoom-fullscreen" else "none" end')"

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
