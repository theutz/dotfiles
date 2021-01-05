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
# WINDOW_SPLIT="$(__query_windows | jq '.split? // ""')"
# WINDOW_ZOOM="$(__query_windows | jq -f ./ubar/scripts/get-zoom-from-window.jq)"
# WINDOW_STICKY="$(__query_windows | jq '.sticky? // ""')"
# WINDOW_FLOATING="$(__query_windows | jq '.floating? // ""')"
WINDOW="$(__query_windows | jq -f ./ubar/scripts/get-window-status.jq)"

echo $(cat <<-EOF
{
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
    },
    "window": $WINDOW
}
EOF
)
