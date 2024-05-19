use xdg.nu

def pueue-group [name: string] {
  pueue status -g $name --json | from json
    | get tasks | values
    | where status == Running | get id.0
    | (pueue log $in; pueue follow $in)
}

export def borders [] {
  pueue-group borders
}

export def skhd [] {
  pueue-group skhd
}

export def yabai [] {
  pueue-group yabai
}
