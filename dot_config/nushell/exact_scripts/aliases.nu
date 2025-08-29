# search for aliases in scope by name
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

alias la = ls -la
alias lg = lazygit
alias ll = ls -l
alias m = ~/.local/bin/mise
alias mx = mise exec
alias pu = pueue
alias sa = search-aliases
alias sp = spotify_player
alias sup = supervisorctl
