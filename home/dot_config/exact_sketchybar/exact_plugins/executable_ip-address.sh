#!/usr/bin/env -S ${HOME}/.local/bin/mise x pup@latest sd@latest jq@latest -- bash
# vim: ft=bash

set -euo pipefail

. "$CONFIG_DIR"/colors.sh

url="https://dnsleaktest.com"
data="$(
    curl -sSL $url |
        pup '.welcome json{}' |
        jq -r '
            [first | .children[].text] |
            {
                ip: .[0] | gsub("Hello "; ""),
                location: .[1] | gsub("from "; "")
            }
        '
)"

ip="$(echo "$data" | jq -r '.ip')"

if [[ -n "$ip" ]]; then
    args+=(
        --set ipaddress
        icon.highlight=off
        label="$ip"
    )
else
    args+=(
        --set ipaddress
        icon.highlight=on
    )
fi

location="$(echo "$data" | jq -r '.location')"

if [[ -n "$location" ]]; then
    args+=(
        --set iplocation
        icon.highlight=off
        label="$location"
        drawing=on
    )
else
    args+=(
        --set iplocation
        icon.highlight=on
        drawing=off
    )
fi

sketchybar "${args[@]}"
