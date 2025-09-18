a
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

# List files
alias la = ls -la
alias ll = ls -l
alias lag = ls -a | grid

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

# Misc
alias pu = pueue
alias sa = search-aliases
alias sp = spotify_player
alias sup = supervisorctl

