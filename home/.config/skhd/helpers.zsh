#!/usr/bin/env zsh
# set -euo pipefail

function skhd-refresh-widget {
  osascript -e "tell application id \"tracesOf.Uebersicht\" to refresh widget id \"skhd-mode-skhd-mode-jsx\""
}

function skhd-reload {
  skhd --reload
  noti -t 'skhd' -m 'Configuration Reloaded!'
  echo "default"
  skhd-refresh-widget
}

function skhd-escape-mode {
    skhd -k "escape"
}
