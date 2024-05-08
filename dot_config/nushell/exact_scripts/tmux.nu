# Load and switch to a session
export def "tmuxp switch" [] {
  tmuxp pick | ^tmuxp load $in
}

export alias tps = tmuxp switch

# Load a session
export def "tmuxp load" [] {
  tmuxp pick | ^tmuxp load -d $in
}

export alias tpl = tmuxp load

# Edit a session
export def "tmuxp edit" [] {
  tmuxp pick | ^tmuxp edit $in
}

export alias tpe = tmuxp edit

# Pick a session
export def "tmuxp pick" [] {
  tmuxp ls | input list --fuzzy --display session 'Pick a session' | get session
}

export alias tpp = tmuxp pick

# List tmuxp sessions
export def "tmuxp ls" [...args] {
  ^tmuxp ls ...$args | from ssv -n | rename session
}

export alias tpls = tmuxp ls
export alias tp = ^tmuxp
export alias tx = ^tmux
export alias txa = ^tmux attach
