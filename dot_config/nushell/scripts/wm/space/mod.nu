export use rotate.nu
export use focus.nu

export def equalize [] {
  yabai -m space --equalize
}

export def balance [] {
  yabai -m space --balance
}

export def create [] {
  yabai -m space --create
}

export def destroy [] {
  let id = (yabai -m query --displays --display | from json
    | get spaces | last)
  yabai -m space --destroy $id
}

export def flip-x [] {
  yabai -m space --mirror x-axis
}

export def flip-y [] {
  yabai -m space --mirror y-axis
}

export def flip-xy [] {
  flip-x
  flip-y
}
