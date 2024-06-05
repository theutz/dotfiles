use chezmoi

alias c        = ^chezmoi
alias e        = ^$env.EDITOR
alias j        = just --highlight
alias lazynvim = nvim --headless "+Lazy! sync" +qa
alias lg       = lazygit
alias sail     = vendor/bin/sail
alias v        = ^$env.VISUAL
alias q        = ^pueue

# Start yazi file manager with cd on exit
def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

def --wrapped artisan [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail artisan ...$args
  } else {
    php artisan ...$args
  }
}

def --wrapped please [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail php please ...$args
  } else {
    php please ...$args
  }
}

def --wrapped composer [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail composer ...$args
  } else {
    ^composer ...$args
  }
}
