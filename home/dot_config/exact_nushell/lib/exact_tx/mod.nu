# Tools for working with tmux & tmuxp

export def main [] {
  help modules tx
}

# Load a tmuxp session
export def load [...name: string]: nothing -> nothing {
  if ($name | is-empty) {
    ^tmuxp ls
    | lines
    | where ($it not-in (ls | get name))
    | input list --multi
  } else {
    $name
  } | par-each {|session|
    ^tmuxp load -d $session
  }
}

export alias l = load

# List all active tmux sessions
export def ls []: nothing -> table {
  ^tmux ls
  | lines
  | split column --regex ':\s+' --number 2 name data
  | insert more {|row|
    $row.data | parse --regex '(?P<windows>\d+) windows \(created (?P<created>.*?)\) ?(?P<attached>\(attached\))?'
  }
  | flatten -a more
  | reject data
  | upsert created {|row| $row.created | into datetime}
  | upsert attached {|row| $row.attached | is-not-empty }
}

# Kill an active tmux session
export def kill-session [...name: string]: nothing -> nothing {
  use std
  if ($name | is-empty) {
    ls | get name | input list --multi
  } else {
    $name
  } | par-each {|session|
    ^tmux kill-session -t $session
    $"killed ($session)..."
  }
}

export alias ks = kill-session
