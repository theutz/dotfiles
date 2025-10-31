#!/usr/bin/env -S ${HOME}/.local/bin/mise exec nushell@latest -- nu
# vim: ft=nu

plugin add nu_plugin_query
plugin use query

let page = http get https://am.i.mullvad.net

let data = $page
  | query web --query '.results p:nth-child(2)'
  | flatten
  | get 0
  | parse --regex r#'IP address: (?<ip>.*?), (?<location>.*)'#
  | update cells { str trim }
  | first

let is_mullvad = $page | query web --query '.results.mullvad'
  | get 0?
  | is-not-empty

[
  --animate sin 10
  --set ipaddress
] | if ($data | is-not-empty) {
  append [
    $"label=($data.location) \(($data.ip)\)"
    label.drawing=on
  ]
} else {
  [
    label.drawing=off
  ]
}
| append [
    icon.highlight=(if $is_mullvad { 'off' } else { 'on' })
]
| sketchybar ...$in

