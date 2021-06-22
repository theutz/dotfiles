#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kill Emacs Daemon
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Emacs

# Documentation:
# @raycast.description Kill the running emacs daemon, if it's there
# @raycast.author Michael Utz
# @raycast.authorURL https://github.com/theutz

if $(which emacsclient) -e '(kill-emacs)'; then
  echo "Emacs daemon started!"
else
  echo "Something went wrong!"
fi
