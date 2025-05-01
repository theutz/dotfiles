#!/usr/bin/env bash

if [[ "$(dark-mode status)" == "off" ]]; then
    COLORS=(
        '#FBF1C7'
        '#CC241D'
        '#98971A'
        '#D79921'
        '#458588'
        '#B16286'
        '#689D6A'
        '#D65D0E'
        '#928374'
        '#9d0006'
        '#79740E'
        '#B57614'
        '#076678'
        '#8F3F71'
        '#427B58'
        '#AF3A03'
        '#7C6F64'
        '#3C3836'
    )
else
    COLORS=(
        '#282828'
        '#CC241D'
        '#98971A'
        '#D79921'
        '#458588'
        '#B16286'
        '#689D6A'
        '#D65D0E'
        '#928374'
        '#FB4934'
        '#B8BB26'
        '#FABD2F'
        '#83A598'
        '#D3869B'
        '#8EC07C'
        '#FE8019'
        '#A89984'
        '#EBDBB2'
    )
fi

function color() {
    local INDEX="${1:-0}"
    local ALPHA="${2:-ff}"
    ALPHA="${ALPHA,,}"

    local COLOR="${COLORS[$INDEX]}"
    COLOR="${COLOR//#/}"
    COLOR="0x${ALPHA}${COLOR,,}"

    echo "$COLOR"
}
