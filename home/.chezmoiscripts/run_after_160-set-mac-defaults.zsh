#!/usr/bin/env zsh

set -euo pipefail

# https://nikitabobko.github.io/AeroSpace/goodies#move-by-dragging-any-part-of-the-window
defaults write -g NSWindowShouldDragOnGesture -bool true

# https://nikitabobko.github.io/AeroSpace/goodies#disable-open-animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
