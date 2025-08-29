def search-aliases [term: string]: nothing -> table<name: string expansion: string description: string> {
  scope aliases
  | where name =~ $term
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
