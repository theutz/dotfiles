# A nu-friendly version of chezmoi status
export def --wrapped main [
  --json # Output as json
  ...args
]: nothing -> table {
  run-external chezmoi status ...$args
  | parse --regex r#'(?<was>[ ADMR])(?<will>[ ADMR]) (?<file>.*$)'#
  | insert status {
    get was will | str join
  }
  | select file status was will
  | upsert since_last_write {|row|
    match $row.was {
      " " => $"(ansi default_dimmed)No change"
      "A" => $"(ansi green_bold)Entry was created"
      "M" => $"(ansi yellow_bold)Entry was modified"
      "D" => $"(ansi red_bold)Entry was removed"
    }
    | $in + (ansi reset)
  }
  | upsert with_next_apply {|row|
    match $row.will {
      " " => $"(ansi default_dimmed)No change"
      "A" => $"(ansi green_bold)Entry will be created"
      "M" => $"(ansi yellow_bold)Entry will be modified"
      "D" => $"(ansi red_bold)Entry will be deleted"
      "R" => $"(ansi magenta_bold)Script will be run"
    }
    | $in + (ansi reset)
  }
  | each {|row|
    if ($row.will =~ R) {
      $row | update cells { [(ansi default_italic) $in (ansi reset_italic)] | str join }
    } else { $row }
  }
  | if ($json) {
    to json | ansi strip
  } else {
    if (is-terminal --stdout) { $in } else {
      $in | table --theme=none --index=false
    }
  }
}
