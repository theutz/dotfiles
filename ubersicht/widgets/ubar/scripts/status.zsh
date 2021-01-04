#!/usr/bin/env zsh

SPACE_INDEX="$(yabai -m query --spaces --space | jq .index)"
SPACE_COUNT="$(yabai -m query --spaces | jq length)"
DISPLAY_INDEX="$(yabai -m query --displays --display | jq .index)"
DISPLAY_COUNT="$(yabai -m query --displays | jq length)"

echo $(cat <<-EOF
{
    "space": {
        "index": $SPACE_INDEX,
        "count": $SPACE_COUNT
    },
    "display": {
        "index": $DISPLAY_INDEX,
        "count": $DISPLAY_COUNT
    }
}
EOF
)
