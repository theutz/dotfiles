#!/usr/bin/env zsh

bin="${HOME}/bin"
mode="$($bin/skhd_mode --get)"

window="$(yabai -m query --windows --window)"
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
  "displayCount": "$display_count"
}
EOF
