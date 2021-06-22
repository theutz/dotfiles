#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start SKHD
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName SKHD

# Documentation:
# @raycast.description Start the SKHD server
# @raycast.author Michael Utz
# @raycast.authorURL https://github.com/theutz

function _get_current_status {
    brew services list | awk '/skhd/ {print $2}'
}

function _handle_command {
    if brew services $1 skhd; then
        echo "SKHD $(_get_current_status)!"
        exit 0
    else
        echo "Something went wrong!"
        exit 1
    fi
}

current_status="$(_get_current_status)"
echo "Current status: ${current_status}"

case $current_status in
    stopped)
        ;&
    error)
        _handle_command start
        ;;
    started)
        _handle_command restart
        ;;
    *)
        >&2 echo "Unknown current_status: ${current_status}"
        exit 1
        ;;
esac
