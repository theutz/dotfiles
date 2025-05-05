#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spotify Player
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🎧
# @raycast.packageName com.theutz.spotify_player_launcher

# Documentation:
# @raycast.description Open spotify_player in a wezterm window
# @raycast.author theutz
# @raycast.authorURL https://raycast.com/theutz

args=(
  --config 'enable_tab_bar=false'

  start
)

echo "Opening spotify_player..."
nohup wezterm "${args[@]}" -- spotify_player >/dev/null 2>&1 &
disown
