#!/usr/bin/env fish

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if test "$SENDER" = volume_change
    set -l VOLUME "$INFO"

    if test $VOLUME -ge 60
        set ICON "󰕾"
    else if test $VOLUME -ge 30 -a $VOLUME -lt 60
        set ICON "󰖀"
    else if test $VOLUME -gt 0 -a $VOLUME -lt 30
        set ICON "󰕿"
    else
        set ICON "󰖁"
    end

    sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
end
