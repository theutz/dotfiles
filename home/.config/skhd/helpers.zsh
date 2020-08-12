#!/usr/bin/env zsh

function skhd_refresh_widget {
  if [ -z "$1" ]; then
    :
  else
    echo "$1"
  fi

  osascript -e "tell application id \"tracesOf.Uebersicht\" to refresh widget id \"skhd-mode-skhd-mode-jsx\""
}

function skhd_reload {
  skhd --reload
  noti -t 'skhd' -m 'Configuration Reloaded!'
  skhd-refresh-widget "default"
}

function skhd_escape_mode {
  local times=`echo ${@:-1} || 1`
  repeat $times skhd -k "escape"
}
