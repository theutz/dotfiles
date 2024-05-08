# Start a tmuxp session
export def "txp start" [] {
  pick_tmuxp_session | ^tmuxp load -d $in
}

def pick_tmuxp_session [] {
  (
    list_tmuxp_sessions |
    input list -f -d session 'Pick a session' |
    get session
  )
}

def list_tmuxp_sessions [] {
    (
      ^tmuxp ls |
      from ssv -n |
      rename session
    )
  }

