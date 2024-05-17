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
  yabai -m space --destroy last
}
