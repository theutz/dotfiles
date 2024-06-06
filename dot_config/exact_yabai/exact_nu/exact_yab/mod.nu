use service.nu

# Convenience wrappers for working with yabai
export def main [] {
    service log -f skhd
}

export def restart [] {
    service restart yabai
}

export use mode.nu
export use focus.nu
export use swap.nu
export use warp.nu
export use move.nu
export use resize.nu
