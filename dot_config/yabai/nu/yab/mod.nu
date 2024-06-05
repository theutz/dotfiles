use service.nu

# Convenience wrappers for working with yabai
export def main [] {
    service logs -f skhd
}

export def restart [] {
    service restart yabai
}

export use mode.nu
export use focus.nu
export use swap.nu
export use warp.nu
