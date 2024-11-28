#!/usr/bin/env zsh

set -euo pipefail

# https://nikitabobko.github.io/AeroSpace/goodies#move-by-dragging-any-part-of-the-window
defaults write -g NSWindowShouldDragOnGesture -bool true

# https://nikitabobko.github.io/AeroSpace/goodies#disable-open-animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
defaults write com.apple.dock expose-group-apps -bool true && killall Dock

# https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer
