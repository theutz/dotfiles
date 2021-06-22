#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Emacs Client
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Emacs

# Documentation:
# @raycast.description Open the Emacs Client
# @raycast.author Michael Utz
# @raycast.authorURL https://github.com/theutz

if $(which emacsclient) --no-wait --create-frame --alternate-editor=""; then
  echo "Emacs Client started!"
else
  echo "Something went wrong!"
fi
