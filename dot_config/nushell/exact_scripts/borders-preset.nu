use rose-pine.nu

def update [] list<string> -> nothing {
  $in | ["borders" ...$in] | pueue add -- ...$in
}

export def default [] {
    [
        $"active_color=0x88(rose-pine dark base)"
        $"inactive_color=0x11(rose-pine dark base)"
        $"blur_radius=10.0"
        $"width=8.0"
    ] | update
}

export def note [] {
    [
        $"active_color=0xff(rose-pine dark iris)"
        $"inactive_color=0x88(rose-pine dark iris)"
        $"blur_radius=10.0"
        $"width=8.0"
    ] | update
}

export def important [] {
    [
        $"active_color=0xff(rose-pine dark foam)"
        $"inactive_color=0x88(rose-pine dark pine)"
        $"blur_radius=10.0"
        $"width=8.0"
    ] | update
}

export def warning [] {
    [
        $"active_color=0xff(rose-pine dark gold)"
        $"inactive_color=0x88(rose-pine dark gold)"
        $"blur_radius=10.0"
        $"width=8.0"
    ] | update
}

export def danger [] {
    [
        $"active_color=0xff(rose-pine dark love)"
        $"inactive_color=0xff(rose-pine dark rose)"
        $"blur_radius=10.0"
        $"width=8.0"
    ] | update
}
