#!/usr/bin/env -S ${HOME}/.local/bin/mise exec aqua:nushell/nushell -- nu
# vim: ft=nu

[
  --animate sin 30
  --set $env.NAME
]
| if $env.SENDER == front_app_switched {
  append [
    $"label=($env.INFO)"
  ]
  | run-external sketchybar ...$in
}
| ignore
