use selectors.nu *

def save-id [] {
  yabai -m query --windows --window | from json | get id
}

export def space [
  selector: string@space-sel
] {
  let id = (save-id)
  yabai -m window --space $selector
}

export def display [
  selector: string@display-sel
] {
  let id = save-id
  yabai -m window --display $selector | complete
  | if $in.exit_code != 0 {
      get stderr | str trim | match ($in) {
        "could not locate the next display." => { display first }
        _ => { print -e $in }
      }
    }
  yabai -m window --focus $id
}
