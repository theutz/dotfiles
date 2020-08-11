#!/usr/bin/env zsh
# set -euo pipefail

source $HOME/.config/skhd/helpers.zsh

function yabai-get-window-id {
    local id=`yabai -m query --windows --window | jq '.id'`
    echo "$id"
}

function yabai-cycle-focus-clockwise {
    if yabai -m window --focus east; then
    elif yabai -m display --focus next; then
        yabai -m window --focus first
    elif yabai -m display --focus first; then
        yabai -m window --focus first
    else
        exit 1
    fi
}

function yabai-cycle-focus-counterclockwise {
    if yabai -m window --focus west; then
    elif yabai -m display --focus prev; then
        yabai -m window --focus last
    elif yabai -m display --focus last; then
        yabai -m window --focus last
    else
        exit 1
    fi
}

function yabai-cycle-focus-downwards {
    if yabai -m window --focus south; then
    elif yabai -m window --focus next; then
    elif yabai -m window --focus first; then
    else
        exit 1
    fi
}

function yabai-cycle-focus-upwards {
    if yabai -m window --focus north; then
    elif yabai -m window --focus prev; then
    elif yabai -m window --focus last; then
    else
        exit 1
    fi
}
