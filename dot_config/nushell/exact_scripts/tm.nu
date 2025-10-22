# Manage tmux, but better

use std null-device

# Execute TMUX command
def --wrapped tmux [...args] {
  run-external tmux ...$args
}

def entities [] {
  [pane window session server]
}

# Kill a tmux entity
export def kill-entity [entity?: string@entities] {
  $entity
  | if ($in | is-empty) {
    entities | input list --fuzzy "Which entity would you like to kill? "
  } else { $in }
  | tmux $"kill-($in)"
}

export alias kill = kill-entity
export alias k = kill-entity

# List tmuxp sessions
export def list-templates [] {
  tmuxp ls | lines
}

export alias ps = list-templates

# Edit tmuxp template in $EDITOR
export def edit-template [template?: string@list-templates] {
  $template
  | if ($in | is-not-empty) { $in } else {
    list-templates | input list --fuzzy "Which template?"
  }
  | tmuxp edit $in
}

export alias pe = edit-template

export def new-session-from-template [
  template?: string@list-templates
] {
  if ($template | is-empty) {
    list-templates | input list --fuzzy "Which template?"
  } else { $template }
  | tee { ^tmuxp load -d -y $in }
  | attach-session $in
}

export alias p = new-session-from-template

# Create a new tmuxp template
export def new-template [] {
  let name = input "What should the name be? "

  {
    session_name: $name
    windows: [
      {
        window_name: main
        panes: ["blank"]
      }
    ]
  } | to yaml
  | save ([$env.XDG_CONFIG_HOME tmuxp $"($name).yml"] | path join)
  | edit-template $name
}

export alias pn = new-template

# List tmux sessions
export def list-sessions [] {
  use std null-device

  ^tmux list-sessions e> (null-device)
    | parse --regex r#'^(?<name>.*?): \d+ windows \(created (?<created>.*?)\)(?<attached> \(attached\))?$'#
    | update created { into datetime }
    | update attached { is-not-empty }
    | uniq-by name
}

export alias ls = list-sessions

def session-names [] {
  list-sessions | get name
}

export def attach-session [session?: string@session-names] {
  let sessions = list-sessions
  
  if ($sessions | is-empty) {
    new-session
    return
  }

  let $session = $session | if ($in | is-empty) {
    $sessions | get name | input list --fuzzy "Which session?"
  } else { $in }
  
  try {
    tmux attach-session -t $session
  } catch {
    tmux switch-client -t $session
  }
}

export alias attach = attach-session
export alias a = attach-session

# Create a new session, or attach to an existing one if the names match
export def new-session [
  --command (-c): string
  session?: string
  window?: string = main
] {
  run-external (
    [tmux new-session -s]
    | append (if ($session | is-empty) { input "Session name: " } else { $session })
    | append [-n $window]
    | if ($env.TMUX? | is-not-empty) { append [-d] } else { $in }
    | if ($command | is-not-empty) { append ($command | split row (char space)) } else { $in }
  )
}

export alias new = new-session
export alias n = new-session

# Show module help
export def main [] {
  help modules tm
}
