#!/usr/bin/env zsh


SPACE_INDEX="$(yabai -m query --spaces --space | jq .index)"
SPACE_COUNT="$(yabai -m query --spaces | jq '[ .[] | select(.display | contains(1)) ] | length')"
DISPLAY_INDEX="$(yabai -m query --displays --display | jq .index)"
DISPLAY_COUNT="$(yabai -m query --displays | jq length)"
SKHD_MODE="$(cat $UBAR_MODE_FILE)"
WINDOW_SPLIT="$(yabai -m query --windows --window | jq .split)"
WINDOW_ZOOM="$(yabai -m query --windows --window | jq -f ./ubar/scripts/get-zoom-from-window.jq)"

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
    "window": {
        "split": $WINDOW_SPLIT,
        "zoom": $WINDOW_ZOOM
    }
}
EOF
)
