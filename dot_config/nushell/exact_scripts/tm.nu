# Manage tmux, but better

export def --wrapped attach [
  session_name?: string
  ...args
] {
  let s = if ($session_name | is-empty) {
    list
    | input list "Which session?" -d name
    | get name
  } else { $session_name }

  tmux attach-session -t $s
}

export alias a = attach

export def list [
  ...args
] {
  tmux list-sessions ...$args
  | parse --regex r#'^(?<name>.*?): (?<windows>\d) windows \(created (?<created>.*?)\)'#
  | update created { into datetime }
}

export def --wrapped new [
  session_name: string,
  --window_name (-n): string = "main",
  ...$args
] {
  tmux new-session -s $session_name -n $window_name ...$args
}

export alias n = new

# With args, just an alias for tmux. Without, an alias for tmux ls
export def --wrapped main [...args] {
  if ($args | is-empty) {
    list
  } else {
    ^tmux ...$args
  }
}
