#!/usr/bin/env bash

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi

case "${PERCENTAGE}" in
[9][0-9] | 100)
    if [[ "$CHARGING" != "" ]]; then
        ICON="󱊦"
    else
        ICON="󱊣"
    fi
    ;;

[3-8][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󱊥"
    else
        ICON="󱊢"
    fi
    ;;

[1-2][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󱊤"
    else
        ICON="󱊡"
    fi
    ;;

[0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰢟"
    else
        ICON="󱃍"
    fi
    ;;

*)
    ICON="󰂑"
    ;;
esac

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
