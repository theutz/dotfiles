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

alias la = ls -la
alias lg = lazygit
alias ll = ls -l
alias m = ~/.local/bin/mise
alias mX = mise exec
alias pu = pueue
alias sa = search-aliases
alias sp = spotify_player
alias sup = supervisorctl

# Execute a program with mise
def mx [
  --package (-p): string # Optionally, the name of the package
  program: string # The name of the package and program to run
  ...args: string # Any additional args
] {
  if ($package | is-empty) { $program } else { $package }
  | ^mise exec $in -- $in ...$args
}
