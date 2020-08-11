#!/usr/bin/env zsh

function skhd-refresh-widget {
  if [[ -z "$1" ]]; then
  else
    echo "$1"
  fi

  osascript -e "tell application id \"tracesOf.Uebersicht\" to refresh widget id \"skhd-mode-skhd-mode-jsx\""
}

function skhd-reload {
  skhd --reload
  noti -t 'skhd' -m 'Configuration Reloaded!'
  skhd-refresh-widget "default"
}

function skhd-escape-mode {
  local times=`echo ${@:-1} || 1`
  repeat $times skhd -k "escape"
}
