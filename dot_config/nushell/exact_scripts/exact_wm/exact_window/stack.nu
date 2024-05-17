use ../space [balance]

def current-win-id [] -> string {
  yabai -m query --windows --window | from json | get id
}

def is-stacked [] -> bool {
  yabai -m query --windows --window | from json | get stack-index | $in > 0
}

export def next [] {
  if (is-stacked) {
    yabai -m window --stack next
  } else {
    yabai -m window next --stack (current-win-id)
  }
}

export def prev [] {
  if (is-stacked) {
    yabai -m window --stack prev
  } else {
    yabai -m window prev --stack (current-win-id)
  }
}

export def pop [] {
  for x in 1..2 {
    yabai -m window --toggle float
  }
  balance
}
