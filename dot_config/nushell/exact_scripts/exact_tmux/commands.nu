# Load and switch to a session
export def "tmuxp switch" [] {
  let session = tmuxp pick
  let has_session = (
    tmux has-session -t $session
    | complete
    | get exit_code
    | $in > 1
  )

  if not $has_session {
    tmuxp load -d $session
  }

  if (tmux attach-session -t $session | complete).exit_code > 0 {
    tmux switch-client -t $session
  }
}

# Load a session
export def "tmuxp load+" [] {
  tmuxp pick | tmuxp load -d $in
}

# Edit a session
export def "tmuxp edit+" [] {
  tmuxp pick | tmuxp edit $in
}

# Pick a session
export def "tmuxp pick" [] {
  (
    tmuxp ls+
    | input list --fuzzy --display session 'Pick a session'
    | get session
  )
}

# List tmuxp sessions
export def "tmuxp ls+" [...args] {
  tmuxp ls ...$args | from ssv -n | rename session
}

# List tmux sessions
export def "tmux ls+" [] {
  tmux ls | from ssv -n -m 1 | get column1 | each { str replace ":" "" }
}

# Kill session interactively
export def "tmux kill-session+" [] {
  let session = (tmux ls+ | input list --fuzzy 'Pick a session')
  tmux kill-session -t $session | complete | if $in.exit_code == 0 {
    $"Killed session: ($session)"
  }
}

# Configure tmux
export def "config tmux" [
  --nushell-config (-n) # configure nushell tmux module
] {
  let path = if $nushell_config {
    $nu.default-config-dir | path join scripts tmux
  } else {
    xdg config tmux
  }
  run-external $env.EDITOR $path
}

# Configure tmuxp
export def "config tmuxp" [
  --nushell-config (-n) # configure nushell tmux module
] {
  if $nushell_config { return }
  run-external $env.EDITOR (xdg config tmuxp)
}
