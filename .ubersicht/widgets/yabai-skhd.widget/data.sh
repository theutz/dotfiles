#!/usr/bin/env zsh

bin="${HOME}/bin"
mode="$($bin/skhd_mode --get)"

window="$(yabai -m query --windows --window)"
win="$(echo $window | jq -r '.app')"
space="$(echo $window | jq -r '.space')"
display="$(echo $window | jq -r '.display')"

cat << EOF
{
  "mode": "$mode",
  "win": "$win",
  "space": "$space",
  "display": "$display"
}
EOF
