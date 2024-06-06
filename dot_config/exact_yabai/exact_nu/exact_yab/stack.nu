use selectors.nu *

export def toggle [] {
    yabai -m query --spaces --space
    | from json
    | match ($in.type | str trim) {
        "stack" => { yabai -m space --layout bsp },
        "bsp" => { yabai -m space --layout stack },
        _ => { error make --unspanned {msg: $"($in) is not a known space type." } }
    }
}

export def all [] {
    yabai -m space --layout stack
}

export def none [] {
    yabai -m space --layout bsp
}

export def window [selector: string@window-sel] {
    yabai -m window --stack $selector
}
