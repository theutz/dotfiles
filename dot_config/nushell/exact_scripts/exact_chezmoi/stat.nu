def parse-status [
  ...args
]: nothing -> table {
  run-external chezmoi status ...$args
  | parse --regex r#'(?<was>[ ADMR])(?<will>[ ADMR]) (?<file>.*$)'#
  | insert status { get was will | str join }
  | select file status was will
}

def translate-first-column []: table -> table {
  upsert since_last_write {|row|
    match $row.was {
      " " => "No change"
      A => "Entry was created"
      M => "Entry was modified"
      D => "Entry was removed"
    }
  }
}

def translate-second-column []: table -> table {
  upsert with_next_apply {|row|
    match $row.will {
      " " => "No change"
      A => "Entry will be created"
      M => "Entry will be modified"
      D => "Entry will be deleted"
      R => "Script will be run"
    }
  }
}

def color-filename []: table -> table {
  update file {|row|
    match [$row.was $row.will] {
      [M M] => [(ansi default_bold)]
      [" " M] => [(ansi yellow)]
      [M " "] => [(ansi yellow)]
      [A D] => [(ansi red)]
      [D A] => [(ansi magenta)]
      [" " D] => [(ansi green)]
      [" " R] => [(ansi default_dimmed)]
      _ => []
    }
    | append [$row.file (ansi reset)]
    | str join
  }
}

def color-scripts []: table -> table {
  each {|row|
    if ($row.will =~ R) {
      $row | update cells { [(ansi default_italic) $in (ansi reset)] | str join }
    } else { $row }
  }
}

# A nu-friendly version of chezmoi status
export def main [
  --json # Output as json
  --global (-g) # Run at $HOME (instead of $PWD)
]: nothing -> table {
  if ($global) { [] } else { [$env.PWD] }
  | parse-status ...$in
  | translate-first-column
  | translate-second-column
  | color-filename
  | color-scripts
  | if ($json) {
    to json | ansi strip
  } else {
    if (is-terminal --stdout) { $in } else {
      $in | table --theme=none --index=false
    }
  }
}
