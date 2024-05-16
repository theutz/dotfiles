export use rotate.nu
export use focus.nu

export def equalize [] {
  yabai -m space --equalize
  skhd -k escape
}

export def balance [] {
  yabai -m space --balance
  skhd -k escape
}

export def create [] {
  yabai -m space --create
}

export def destroy [] {
  yabai -m space --destroy last
}
