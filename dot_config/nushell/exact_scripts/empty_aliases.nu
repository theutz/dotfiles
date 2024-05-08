def aliases [] {
  chezmoi edit ([$env.NU_LIB_DIRS.0 aliases.nu] | str join (char psep))
}

alias lg = lazygit
alias gf = git fetch
alias gfm = git pull
alias gws = git status --short
alias gwS = git status
alias j = just --highlight

def yab [] {
  sudo yabai --load-sa
  yabai --restart-service
}
