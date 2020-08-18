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

# -------------- #
# - Normal (G) - #
# -------------- #

function skhd_normal_g_j () {
    yabai_cycle_window_focus_by_index_desc
    skhd_escape_mode
}

function skhd_normal_g_k () {
    yabai_cycle_window_focus_by_index_asc
    skhd_escape_mode
}

function skhd_normal_g_t () {
    yabai_cycle_focus_to_next_space
    skhd_escape_mode
}

function skhd_normal_g_shift_t () {
    yabai_cycle_focus_to_prev_space
    skhd_escape_mode
}


# -------- #
# - Yank - #
# -------- #

function skhd_yank_1 () {
    yabai_move_current_window_to_space_by_index 1
    skhd_escape_mode
}

function skhd_yank_2 () {
    yabai_move_current_window_to_space_by_index 2
    skhd_escape_mode
}

function skhd_yank_3 () {
    yabai_move_current_window_to_space_by_index 3
    skhd_escape_mode
}

function skhd_yank_4 () {
    yabai_move_current_window_to_space_by_index 4
    skhd_escape_mode
}

function skhd_yank_5 () {
    yabai_move_current_window_to_space_by_index 5
    skhd_escape_mode
}

function skhd_yank_6 () {
    yabai_move_current_window_to_space_by_index 6
    skhd_escape_mode
}

function skhd_yank_7 () {
    yabai_move_current_window_to_space_by_index 7
    skhd_escape_mode
}

function skhd_yank_8 () {
    yabai_move_current_window_to_space_by_index 8
    skhd_escape_mode
}

function skhd_yank_9 () {
    yabai_move_current_window_to_space_by_index 9
    skhd_escape_mode
}

function skhd_yank_shift_1 () {
    yabai_move_space 1
    skhd_escape_mode
}

function skhd_yank_shift_2 () {
    yabai_move_space 2
    skhd_escape_mode
}

function skhd_yank_shift_3 () {
    yabai_move_space 3
    skhd_escape_mode
}

function skhd_yank_shift_4 () {
    yabai_move_space 4
    skhd_escape_mode
}

function skhd_yank_shift_5 () {
    yabai_move_space 5
    skhd_escape_mode
}

function skhd_yank_shift_6 () {
    yabai_move_space 6
    skhd_escape_mode
}

function skhd_yank_shift_7 () {
    yabai_move_space 7
    skhd_escape_mode
}

function skhd_yank_shift_8 () {
    yabai_move_space 8
    skhd_escape_mode
}

function skhd_yank_shift_9 () {
    yabai_move_space 9
    skhd_escape_mode
}

function skhd_yank_h () {
    yabai_swap_window_counterclockwise
    skhd_escape_mode
}

function skhd_yank_j () {
    yabai_swap_window_downwards
    skhd_escape_mode
}

function skhd_yank_k () {
    yabai_swap_window_upwards
    skhd_escape_mode
}

function skhd_yank_l () {
    yabai_swap_window_clockwise
    skhd_escape_mode
}

function skhd_yank_ctrl_d () {
    yabai_move_current_window_to_next_display
    skhd_escape_mode
}

function skhd_yank_ctrl_u () {
    yabai_move_current_window_to_prev_display
    skhd_escape_mode
}

function skhd_yank_shift_h () {
    yabai_move_current_window_to_prev_space
    skhd_escape_mode
}

function skhd_yank_shift_l () {
    yabai_move_current_window_to_next_space
    skhd_escape_mode
}

function skhd_yank_shift_t () {
    yabai_move_current_window_to_new_space
    skhd_escape_mode
}

# ------------ #
# - Yank (G) - #
# ------------ #

function skhd_yank_g_t () {
  yabai_move_space next
  skhd_escape_mode 2
}

function skhd_yank_g_shift_t () {
    yabai_move_space prev
    skhd_escape_mode 2
}
