#!/usr/bin/env bash

if ! yabai -m window --focus prev; then
  yabai -m window --focus last
fi
