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
export def list []: nothing -> table {
  ^tmux ls | complete | get stdout
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
    list | get name 
    | append (^tmuxp ls 
      | lines
    )
    | uniq 
    | sort
    | input list --fuzzy
  } else {
    $name
  }

  ^tmux has-session -t $session | complete | match $in.exit_code {
    0 => {
      let cmd = if ($env.TMUX? | is-empty) {
        "attach"
      } else {
        "switch-client"
      }
      ^tmux $cmd -t $session 
    }
    _ => {
      load $session
      attach $session
    }
  }
}

export alias a = attach

export def edit [name?: string]: nothing -> nothing {
  if ($name | is-empty) {
  } else {
    $env.XDG_CONFIG_HOME
    | path join "tmuxp" $"($name).yml"
    | if ($in | path exists) { $in } else {
      tee {|file|
        $file | path dirname | mkdir $in
        touch $file
        ^chezmoi add $file
      }
    }
  }
}
# export def edit [
#   name?: string
#   --new (-n) # create a new session file
# ]: nothing -> nothing {
#   if ($new == true and ($name | is-not-empty)) {
#     let dir = $env.XDG_CONFIG_HOME | path join "tmuxp"
#     mkdir $dir
#     let file = $dir | path join $"($name).yml"
#     touch $file
#     ^chezmoi add $file
#   }
#
#   let sessions = ^tmuxp ls | lines -s
#
#   let session = if ($name | is-empty) {
#     $sessions | input list --fuzzy
#   } else {
#     $name
#   }
#
#   if ($session | is-empty) {
#     error make { msg: "No session specified", label: { span: (metadata $in).span, text: "error occurred here" }}
#   }
#
#   if ($sessions | any {|it| $it == $session}) {
#     ^tmuxp edit $session
#   }
# }

export alias e = edit

export module aliases {
  export alias txa = attach
  export alias txls = list
  export alias txks = kill-session
  export alias txl = load
  export alias txe = edit
}
