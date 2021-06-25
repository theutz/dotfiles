#!/usr/bin/env zsh

mode="$($HOME/bin/skhd_mode --get)"
cmd="$($HOME/bin/skhd_cmd --get)"

if [[ $(yabai -m query --windows --space | jq '. | length') -gt 0 ]]; then
  window="$(yabai -m query --windows --window)"
else
  window=$(cat <<EOF
{
  "app": "___",
  "space": "$(yabai -m query --spaces --space | jq '.index')",
  "display": "$(yabai -m query --displays --display | jq '.index')"
}
EOF
)
fi

win="$(echo $window | jq -r '.app')"
space="$(echo $window | jq -r '.space')"
display="$(echo $window | jq -r '.display')"

spaces="$(yabai -m query --spaces)"
space_count="$(echo $spaces | jq '. | length')"

displays="$(yabai -m query --displays)"
display_count="$(echo $displays | jq '. | length')"

cat << EOF
{
  "mode": "$mode",
  "win": "$win",
  "space": "$space",
  "spaceCount": "$space_count",
  "display": "$display",
  "displayCount": "$display_count",
  "lastCmd": "$cmd"
}
EOF
