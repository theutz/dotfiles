#!/usr/bin/env bash

if ! yabai -m window --focus next; then
  yabai -m window --focus first
fi
