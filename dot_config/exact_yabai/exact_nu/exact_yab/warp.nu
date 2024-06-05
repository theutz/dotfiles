use selectors.nu *
use mode.nu *

export def window [
  selector: string@window-sel
] {
  yabai -m window --warp $selector
}
