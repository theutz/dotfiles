use selectors.nu *

export def window [
  selector: string@window-sel
] {
  yabai -m window --swap $selector
}

export def space [
  selector: string@space-sel
] {
  yabai -m space --swap $selector
}
