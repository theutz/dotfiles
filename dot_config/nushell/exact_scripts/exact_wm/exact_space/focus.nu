export def next [] {
  yabai -m space --focus next
  sleep 0.2sec
  yabai -m window --focus first
}

export def prev [] {
  yabai -m space --focus prev
  sleep 0.2sec
  yabai -m window --focus first
}

export def main [selector: string] {
  yabai -m space --focus $selector
}
