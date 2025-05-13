#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spawn Neovide
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📟
# @raycast.packageName com.theutz.spawn-neovide

# Documentation:
# @raycast.description Spawn a new instance of Neovide
# @raycast.author theutz
# @raycast.authorURL https://raycast.com/theutz

neovide --fork "$HOME"
