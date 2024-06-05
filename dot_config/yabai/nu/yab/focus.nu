use selectors.nu *

export def window [
  selector: string@window-sel
] {
    yabai -m window --focus $selector
}

export def space [
  selector: string@space-sel
] {
    yabai -m space --focus $selector
}

export def display [
  selector: string@display-sel
] {
    yabai -m display --focus $selector
}
