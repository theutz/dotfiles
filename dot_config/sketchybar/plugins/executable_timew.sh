#!/bin/zsh

if msg="$(timew)"; then
  sketchybar --set $NAME drawing=on
else
  sketchybar --set $NAME drawing=off
  exit 0
fi

title="$(echo $msg | head -1)"
time="$(echo $msg | awk '/Total/ { print $2 }')"

sketchybar --set $NAME label="$title $time"
