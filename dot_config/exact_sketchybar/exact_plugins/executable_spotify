#!/usr/bin/env -S ${HOME}/.local/bin/mise exec aqua:nushell/nushell -- nu
# vim: ft=nu

def --env get-info [
  path?: cell-path
]: nothing -> record {
  $env.spotify_info = $env.spotify_info?
  | default (^spotify_player get key playback | from json)

  $env.spotify_info
  | if ($path | is-not-empty) { get $path } else { $in }
}

def is-active []: nothing -> bool {
  get-info device?.is_active? | default false
}

def is-playing []: nothing -> bool {
  get-info is_playing? | default false
}

def track []: nothing -> string {
  get-info item?.name? | default ""
}

def artist []: nothing -> string {
  get-info item?.artists?.name? | default []
  | str join ", "
}

match [(is-active) (is-playing)] {
  [true true] => [
    --set spotify
    drawing=on
    icon.highlight=off
    $"label=(track) - (artist)"
  ]
  [true false] => [
    --set spotify
    drawing=on
    icon.highlight=on
  ]
  _ => [
    --set spotify
    drawing=off
  ]
}
| prepend [
  --animate quadratic 30
]
| run-external sketchybar ...$in
