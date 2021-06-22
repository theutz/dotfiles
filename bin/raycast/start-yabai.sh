#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Yabai
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Start / restart the yabai service
# @raycast.author Michael Utz
# @raycast.authorURL https://github.com/theutz

status="$(brew services list | awk '/yabai/ {print $2}')"

echo "Current status: ${status}"

if [[ $status == 'stopped' || $status == 'error' ]]; then
    echo "Starting yabai..."
    brew services start yabai
else
    echo "Restarting yabai..."
    brew services restart yabai
fi

if [[ "$?" == 0 ]]; then
    echo "Yabai started!"
else
    echo "Something went wrong!"
fi
