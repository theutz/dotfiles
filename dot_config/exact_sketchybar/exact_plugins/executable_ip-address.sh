#!/usr/bin/env -S ${HOME}/.local/bin/mise x pup@latest sd@latest jq@latest doggo@latest -- bash
# vim: ft=bash

set -euo pipefail

. "$CONFIG_DIR"/colors.sh

duration=10
curve="sin"

args+=(
    --animate "$curve" "$duration"
    --set ipaddress
    label.highlight=on
    --set iplocation
    label.highlight=on
)
sketchybar "${args[@]}"

set +eo pipefail
domain="dnsleaktest.com"
url="https://$domain"
ip="$(doggo $domain A @1.1.1.1 --short)"
data="$(
    curl --resolve "$domain:443:$ip" -sSL $url |
        pup '.welcome json{}' |
        jq -r '
            [first | .children[].text] |
            {
                ip: .[0] | gsub("Hello "; ""),
                location: .[1] | gsub("from "; "")
            }
        '
)"
set -eo pipefail

ip="$(jq -r '.ip' <<<"$data")"

args+=(
    --animate "$curve" "$duration"
)

if [[ -n "$ip" ]]; then
    args+=(
        --set ipaddress
        icon.highlight=off
        label="$ip"
        label.highlight=off
    )
else
    args+=(
        --set ipaddress
        icon.highlight=on
        label=""
    )
fi

location="$(jq -r '.location' <<<"$data")"

args+=(
    --animate "$curve" "$duration"
)

if [[ -n "$location" ]]; then
    args+=(
        --set iplocation
        icon.highlight=off
        label="$location"
        drawing=on
        label.highlight=off
    )
else
    args+=(
        --set iplocation
        icon.highlight=on
        drawing=off
    )
fi

sketchybar "${args[@]}"
