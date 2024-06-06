use selectors.nu *

export def window [
  ...selectors: string@window-sel
] {
    $selectors | each {|selector|
        yabai -m window --focus $selector | complete | if ($in.exit_code == 0) { exit }
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
