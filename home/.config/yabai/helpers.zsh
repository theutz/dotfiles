#!/usr/bin/env zsh

source $HOME/.config/skhd/helpers.zsh

function yabai-cycle-window-focus-clockwise {
    if yabai -m window --focus east; then
    elif yabai -m display --focus next; then
        yabai -m window --focus first
    elif yabai -m display --focus first; then
        yabai -m window --focus first
    else exit 1
    fi
}

function yabai-cycle-window-focus-counterclockwise {
    if yabai -m window --focus west; then
    elif yabai -m display --focus prev; then
        yabai -m window --focus last
    elif yabai -m display --focus last; then
        yabai -m window --focus last
    else exit 1
    fi
}

function yabai-cycle-window-focus-downwards {
    if yabai -m window --focus south; then
    elif yabai -m window --focus next; then
    elif yabai -m window --focus first; then
    else exit 1
    fi
}

function yabai-cycle-window-focus-upwards {
    if yabai -m window --focus north; then
    elif yabai -m window --focus prev; then
    elif yabai -m window --focus last; then
    else exit 1
    fi
}

function yabai-cycle-window-focus-by-index-desc {
    if yabai -m window --focus next; then
    else yabai -m window --focus first
    fi
}

function yabai-cycle-window-focus-by-index-asc {
    if yabai -m window --focus prev; then
    else yabai -m window --focus last
    fi
}

function yabai-cycle-focus-to-next-space {
    if yabai -m space --focus next; then
    else yabai -m space --focus first
    fi
}

function yabai-cycle-focus-to-prev-space {
    if yabai -m space --focus prev; then
    else yabai -m space --focus last
    fi
}

function yabai-focus-space-by-number {
    yabai -m space --focus $1
}

function yabai-get-window-id {
    local id=`yabai -m query --windows --window | jq '.id'`
    echo "$id"
}

function yabai-move-current-window-to-new-space {
    if yabai -m space --create; then
        local new_space_index=`yabai -m query --spaces --display | jq '.[-1].index'`
        local window_id=`yabai-get-window-id`
        yabai -m window --space $new_space_index
        yabai -m window --focus $window_id
    fi
    skhd-escape-mode
}

function yabai-get-window-ids-in-current-space {
    local ids=`yabai -m query --windows --space | jq '.[].id'`
    echo "$ids"
}

function yabai-destroy-current-space {
    local current_window_id=`yabai-get-window-id`
    for window_id in `yabai-get-window-ids-in-current-space`; do
        yabai -m window $window_id --space prev
    done
    yabai -m space --destroy
    yabai -m window --focus $current_window_id
    skhd-escape-mode
}

function yabai-move-current-window-to-next-space {
    local id=`yabai-get-window-id`
    yabai -m window --space next
    yabai -m window --focus $id
}

function yabai-move-current-window-to-prev-space {
    local id=`yabai-get-window-id`
    yabai -m window --space prev
    yabai -m window --focus $id
}

function yabai-move-current-window-to-space-by-index {
    local id=`yabai-get-window-id`
    yabai -m window --space $1
    yabai -m window --focus $id
    skhd-escape-mode
}

function yabai-cycle-focus-to-next-display {
    if yabai -m display --focus next; then
    elif yabai -m display --focus first; then
    else exit 1
    fi
}

function yabai-cycle-focus-to-prev-display {
    if yabai -m display --focus prev; then
    elif yabai -m display --focus last; then
    else exit 1
    fi
}

function yabai-move-current-window-to-next-display {
    local id=`yabai-get-window-id`
    yabai -m window --display next
    yabai -m window --focus $id
    skhd-escape-mode
}

function yabai-move-current-window-to-prev-display {
    local id=`yabai-get-window-id`
    yabai -m window --display prev
    yabai -m window --focus $id
    skhd-escape-mode
}

function yabai-toggle-mouse-autofocus {
    case `yabai -m config focus_follows_mouse` in
        'disabled')
            yabai -m config focus_follows_mouse autoraise
            ;;
        *)
            yabai -m config focus_follows_mouse off
            ;;
    esac

    if [[ `yabai -m config mouse_follows_focus` == 'on' ]]; then
        yabai -m config mouse_follows_focus off
    else
        yabai -m config mouse_follows_focus on
    fi
}
