# search for aliases in scope by name
@example "search for an alias starting with 'm'" {
  sa ^m
}
@example "search for an alias with the word 'mise' in it" {
  sa -a mise
}
def search-aliases [
  --all (-a) # Search in all fields, not just name
  term: string # The term to search for
]: nothing -> table<name: string expansion: string description: string> {
  scope aliases
  | if ($all) {
    find --regex $term --no-highlight
  } else {
    where name =~ $term
  }
  | select name expansion description
}

# LS
alias la = ls -la
alias ll = ls -l
def ls-all-grid [] {
  ls --all | grid --icons --color
}
alias l = ls-all-grid

# Lazy
alias lg = lazygit
alias ldk = lazydocker

# Mise
alias m = ^mise
alias mx = ^mise exec
alias mr = ^mise run

# Docker
alias dk = docker
alias dkc = docker compose

# Pueue

alias pu = pueue
alias puG = pueue group
alias pua = pueue add
alias puag = pueue add --group
alias pucl = pueue clean
alias puf = pueue follow
alias puga = pueue group add
alias pugr = pueue group remove
alias pupa = pueue parallel
alias pupag = pueue parallel --group
alias puw = pueue wait

# pueue group status
def pug [] { pueue group --json | from json | transpose name | flatten }

# pueue task status
def pus [] { pueue status --json | from json | get tasks | flatten }

# tmux

# List tmux sessions
def txls [] {
  tmux ls -F '#{session_id} #{session_name} #{?session_attached,true,false}'
  | detect columns --no-headers
  | rename id name attached
  | update attached { into bool }
  | sort-by id
}

# Create new tmux session
def --wrapped txn [
  session: string # Name of the session
  window: string = "main" # Name of the first window
  ...args
] {
  tmux new -s $session -n $window ...$args
}

# Miscellaneous
alias sa = search-aliases
alias sp = spotify_player
alias sup = supervisorctl
alias ze = zoxide edit

