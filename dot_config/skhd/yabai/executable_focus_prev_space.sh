#!/usr/bin/env bash

if ! yabai -m space --focus prev; then
  yabai -m space --focus last
fi
