#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop Yabai
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Stop the yabai server
# @raycast.author Michael Utz
# @raycast.authorURL https://github.com/theutz

status="$(brew services list | awk '/yabai/ {print $2}')"

if [[ $status == 'started' ]]; then
    echo "Stopping yabai..."
    brew services stop yabai
fi

if [[ "$?" == 0 ]]; then
    echo "Yabai stopped."
else
    echo "Something went wrong."
fi
