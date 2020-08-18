#!/usr/bin/env zsh
#set -euo pipefail

local current=$(dirname "$0")

. $current/helpers.zsh
source "$HOME/.config/yabai/helpers.zsh"

# ---------- #
# - Normal - #
# ---------- #

function skhd_normal_tab () {
    yabai -m space --balance
}

function skhd_normal_h () {
    yabai_cycle_window_focus_counterclockwise
}

function skhd_normal_l () {
    yabai_cycle_window_focus_clockwise
}

function skhd_normal_j () {
    yabai_cycle_window_focus_downwards
}

function skhd_normal_k () {
    yabai_cycle_window_focus_upwards
}

function skhd_normal_ctrl_u () {
    yabai_cycle_focus_to_prev_display
}

function skhd_normal_ctrl_d () {
    yabai_cycle_focus_to_next_display
}

function skhd_normal_shift_h () {
    yabai_cycle_focus_to_prev_space
}

function skhd_normal_shift_l () {
    yabai_cycle_focus_to_next_space
}

function skhd_normal_c () {
    yabai_destroy_current_space
}

function skhd_normal_y () {
    yabai -m space --mirror y-axis
}

function skhd_normal_x () {
    yabai -m space --mirror x-axis
}

function skhd_normal_r () {
    yabai -m space --rotate 270
}

function skhd_normal_shift_r () {
    yabai -m space --rotate 90
}

function skhd_normal_v () {
    yabai -m window --toggle split
}

function skhd_normal_z () {
    yabai -m window --toggle zoom-parent
}

function skhd_normal_shift_z () {
    yabai -m window --toggle zoom-fullscreen
}

function skhd_normal_shift_t () {
    yabai -m space --create
}

function skhd_normal_1 () {
    yabai -m space --focus 1
}

function skhd_normal_2 () {
    yabai -m space --focus 2
}

function skhd_normal_3 () {
    yabai -m space --focus 3
}

function skhd_normal_4 () {
    yabai -m space --focus 4
}

function skhd_normal_5 () {
    yabai -m space --focus 5
}

function skhd_normal_6 () {
    yabai -m space --focus 6
}

function skhd_normal_7 () {
    yabai -m space --focus 7
}

function skhd_normal_8 () {
    yabai -m space --focus 8
}

function skhd_normal_9 () {
    yabai -m space --focus 9
}
