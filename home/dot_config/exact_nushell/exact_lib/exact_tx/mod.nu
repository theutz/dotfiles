# Tools for working with tmux & tmuxp

export def main [] {
  help modules tx
}

# Load a tmuxp session
export def load [...name: string]: nothing -> nothing {
  $name
  | if ($name | is-empty) {
    ^tmuxp ls | lines -s
    | input list --multi
  } else {$name}
  | ^tmuxp load -d ...$in
}

export alias l = load

# List all active tmux sessions
export def list []: nothing -> table {
  ^tmux ls | complete | get stdout
  | lines -s
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
  if ($name | is-empty) {
    list | get name |
    | if ($in | is-not-empty) {
      input list --multi
    } else {
      error make {
        msg: "Could not list killed sessions",
        label: {
          span: (metadata $in).span, text: "error occurred here" }
      }
    }
  }
  | par-each {|session|
    ^tmux kill-session -t $session
    $"killed ($session)..."
  }
}

export alias ks = kill-session

# Attach to a tmux session or load and attach to a tmuxp session
export def attach [name?: string]: nothing -> nothing {
  let session = if ($name | is-empty) {
    list | get name | append (
      ^tmuxp ls | lines
    )
    | uniq | sort
    | input list --fuzzy
  } else {$name}

  ^tmux has-session -t $session
  | complete
  | match $in.exit_code {
    0 => {
      $env.TMUX?
      | is-empty
      | if ($in) {"attach"} else {"switch-client"}
      | ^tmux $in -t $session 
    }
    _ => { load $session; attach $session }
  }
}

export alias a = attach

export def edit [name?: string]: nothing -> nothing {
  if ($name | is-empty) {
    "*.y<a>ml"
  } else {
    $"*($name)*.y<a>ml"
  }
  | glob $"(xdg config tmuxp)/($in)"
  | wrap path
  | upsert name {|it|
    $it.path
    | path basename
    | split column "." name extension
    | get name.0
  }
  | input list -d name --fuzzy
  | get path
  | ^chezmoi edit --watch $in
}

export alias e = edit

export module aliases {
  export alias txa = attach
  export alias txls = list
  export alias txks = kill-session
  export alias txl = load
  export alias txe = edit
}
