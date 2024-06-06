use selectors.nu *

export def window [
  selector: string@window-sel
  --cycle (-c)
] {
    yabai -m window --focus $selector | complete | if ($in.exit_code != 0 and $cycle) {
        get stderr | str trim | match ($in) {
            "could not locate a southward managed window." => { print $"($in) cycling north."; window north },
            "could not locate a northward managed window." => { print $"($in) cycling south."; window south },
            "could not locate a eastward managed window." => { print $"($in) cycling west."; window west },
            "could not locate a westward managed window." => { print $"($in) cycling east."; window east },
            _ => { print -e $in }
        }
    }
}

export def space [
  selector: string@space-sel
] {
    yabai -m space --focus $selector
}

export def display [
  selector: string@display-sel
] {
    yabai -m display --focus $selector | complete | if $in.exit_code != 0 {
        get stderr | str trim | match ($in) {
            "could not locate the next display." => { print $"($in) cycling to first."; display first }
            "could not locate the previous display." => { print $"($in) cycling to last."; display last }
            _ => { print -e $in }
        }
      }
}
