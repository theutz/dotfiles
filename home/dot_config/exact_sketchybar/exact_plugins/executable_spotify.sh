#!/usr/bin/env bash

set -euo pipefail

PATH="$HOME/bin:$PATH"

info="$(spotify_player get key playback)"

if [[ -n "$info" && "$info" != "null" ]]; then
    is_playing="$(jq -r '.is_playing' <<<"$info")"
    track="$(jq -r '.item.name' <<<"$info")"
    artist="$(jq -r '.item.artists | map(.name) | join(", ")' <<<"$info")"
else
    is_playing=false
    track=""
    artist=""
fi

is_multi="$(sketchybar --query displays | jq -r 'length | . > 1')"

args=(
    --animate quadratic 30
    --set "$NAME"
)

if $is_multi; then
    args+=(
        label.max_chars=0
    )
else
    args+=(
        label.max_chars=40
    )
fi

if $is_playing; then
    args+=(
        drawing=on
        label="$track - $artist"
    )
else
    args+=(
        drawing=off
    )
fi

sketchybar "${args[@]}"
