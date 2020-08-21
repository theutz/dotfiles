#!/usr/bin/env sh

# shellcheck source=../skhd/helpers.zsh
. "$HOME/.config/skhd/helpers.zsh"

yabye() {
    local out

    if
        out=$(eval yabai -m "$@" 2>&1 1>/dev/null)
    then
        return 0
    else
        noti -t yabai -m "$out"
        return 1
    fi
}

yabai_cycle_window_focus_clockwise() {
    local output;

    # Try east window

    if
        output="$(yabai -m window --focus east 2>&1 > /dev/null)"
    then
        exit 0
    else
        noti -t yabai -m "$output"
    fi

    # Try next window

    if
        output="$(yabai -m window --focus next 2>&1 > /dev/null)"
    then
        yabai -m window --focus first
        exit 0
    else
        noti -t yabai -m "$output"
    fi

    # Try next display

    if
        output="$(yabai -m display --focus last 2>&1 > /dev/null)"
    then
        yabai -m window --focus first
        exit 0
    else
        noti -t yabai -m "$output"
    fi

    exit 1
}

yabai_swap_window_clockwise() {
    local id="$(yabai_get_window_id)"
    if yabai -m window --swap east; then :
    elif yabai -m window --swap next; then :
    elif yabai -m window --display next; then
        yabai -m window --focus "$id"
    else exit 1
    fi
}

yabai_cycle_window_focus_counterclockwise() {
    if yabai -m window --focus west; then :
    elif yabai -m display --focus prev; then
        yabai -m window --focus last
    elif yabai -m display --focus last; then
        yabai -m window --focus last
    else exit 1
    fi
}

yabai_swap_window_counterclockwise() {
    local id="$(yabai_get_window_id)"
    if yabai -m window --swap west; then :
    elif yabai -m window --swap prev; then :
    elif yabai -m window --display prev; then
        yabai -m window --focus "$id"
    else exit 1
    fi
}

yabai_cycle_window_focus_downwards() {
    if yabai -m window --focus south; then :
    elif yabai -m window --focus next; then :
    elif yabai -m window --focus first; then :
    else exit 1
    fi
}

yabai_swap_window_downwards() {
    if yabai -m window --swap south; then :
    elif yabai -m window --swap next; then :
    elif yabai -window --swap first; then :
    else exit 1
    fi
}

yabai_cycle_window_focus_upwards() {
    if yabai -m window --focus north; then :
    elif yabai -m window --focus prev; then :
    elif yabai -m window --focus last; then :
    else exit 1
    fi
}

yabai_swap_window_upwards() {
    if yabai -m window --swap north; then :
    elif yabai -m window --swap prev; then :
    elif yabai -m window --swap last; then :
    else exit 1
    fi
}

yabai_cycle_window_focus_by_index_desc() {
    if yabai -m window --focus next; then :
    else yabai -m window --focus first
    fi
}

yabai_cycle_window_focus_by_index_asc() {
    if yabai -m window --focus prev; then :
    else yabai -m window --focus last
    fi
}

yabai_cycle_focus_to_next_space() {
    if yabai -m space --focus next; then :
    else yabai -m space --focus first
    fi
}

yabai_cycle_focus_to_prev_space() {
    if yabai -m space --focus prev; then :
    else yabai -m space --focus last
    fi
}

yabai_get_window_id() {
    local id
    id="$(yabai -m query --windows --window | jq '.id')"
    echo "$id"
}

yabai_move_current_window_to_new_space() {
    if yabai -m space --create; then
        local new_space_index
        new_space_index="$(yabai -m query --spaces --display | jq '.[-1].index')"

        local window_id
        window_id="$(yabai_get_window_id)"

        yabai -m window --space "$new_space_index"
        yabai -m window --focus "$window_id"
    fi
}

yabai_get_window_ids_in_current_space() {
    local ids
    ids="$(yabai -m query --windows --space | jq '.[].id')"
    echo "$ids"
}

yabai_destroy_current_space() {
    local current_window_id
    current_window_id="$(yabai_get_window_id)"

    for window_id in $(yabai_get_window_ids_in_current_space); do
        yabai -m window "$window_id" --space prev
    done
    yabai -m space --destroy
    yabai -m window --focus "$current_window_id"
}

yabai_move_current_window_to_next_space() {
    local id
    id="$(yabai_get_window_id)"
    yabai -m window --space next
    yabai -m window --focus "$id"
}

yabai_move_current_window_to_prev_space() {
    local id
    id="$(yabai_get_window_id)"
    yabai -m window --space prev
    yabai -m window --focus "$id"
}

yabai_move_current_window_to_space_by_index() {
    local id
    id="$(yabai_get_window_id)"
    yabai -m window --space "$1"
    yabai -m window --focus "$id"
}

yabai_move_space() {
    yabai -m space --move "$1"
    yabai_update_ubersicht
}

yabai_cycle_focus_to_next_display() {
    if yabai -m display --focus next; then :
    elif yabai -m display --focus first; then :
    else exit 1
    fi
}

yabai_cycle_focus_to_prev_display() {
    if yabai -m display --focus prev; then :
    elif yabai -m display --focus last; then :
    else exit 1
    fi
}

yabai_move_current_window_to_next_display() {
    local id
    id="$(yabai_get_window_id)"

    if yabai -m window --display next; then
        yabai -m window --focus "$id"
    fi
}

yabai_move_current_window_to_prev_display() {
    local id
    id="$(yabai_get_window_id)"

    if yabai -m window --display prev; then
        yabai -m window --focus "$id"
    fi
}

yabai_toggle_mouse_autofocus() {
    case "$(yabai -m config focus_follows_mouse)" in
        'disabled')
            yabai -m config focus_follows_mouse autoraise
            ;;
        *)
            yabai -m config focus_follows_mouse off
            ;;
    esac

    if [ "$(yabai -m config mouse_follows_focus)" = 'on' ]; then
        yabai -m config mouse_follows_focus off
    else
        yabai -m config mouse_follows_focus on
    fi
}

yabai_cycle_swap_window_downwards() {
    if yabai -m window --swap south; then :
    else yabai -m window --swap next
    fi
}

yabai_update_ubersicht() {
    osascript -e 'tell application id "tracesOf.Uebersicht" to refresh widget id "nibar-spaces-primary-jsx"'
    osascript -e 'tell application id "tracesOf.Uebersicht" to refresh widget id "nibar-spaces-secondary-jsx"'
}

# Local Variables:
# flycheck-shellcheck-excluded-warnings: ("SC2039")
# End:
