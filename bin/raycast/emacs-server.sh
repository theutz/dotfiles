#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Emacs Server
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Emacs

# Documentation:
# @raycast.description Start the emacs daemon
# @raycast.author Michael Utz
# @raycast.authorURL https://github.com/theutz

if $(which emacs) --daemon; then
    echo "Emacs Server started!"
else
    echo "Something went wrong!"
fi
