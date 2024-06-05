export def stack-sel [] {
  [prev next first last recent] | each { $"stack.($in)" }
}

export def dir-sel [] {
  [north east south west]
}

export def window-sel [] {
  [
    prev          next           first          last
    recent        mouse          largest        smallest
    sibling       first_nephew   second_nephew  uncle
    first_cousin  second_cousin
  ] ++ (dir-sel) ++ (stack-sel)
  | each {|x| {value: $x, description: $x} }
  | append (
        yabai -m query --windows
            | from json
            | select id app title
            | each {|x|
                {value: $x.id, description: $"($x.app): ($x.title)"}
            }
    )
}

export def space-sel [] {
  [
    prev   next
    first  last
    recent mouse
  ]
  | append (yabai -m query --spaces | from json | get index)
  | append (yabai -m query --spaces | from json | get label | compact --empty)
}

export def display-sel [] {
  [prev next first last recent mouse] ++ (dir-sel)
  | append (yabai -m query --displays | from json | get index)
  | append (yabai -m query --displays | from json | get label | compact --empty)
}
