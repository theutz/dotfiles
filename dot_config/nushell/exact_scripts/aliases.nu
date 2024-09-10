use chezmoi

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

# Run commands with Laravel Sail
def --wrapped sail [...args] {
  if ('vendor/bin/sail' | path exists) {
     print -e "🐳 Running in docker..."
     vendor/bin/sail ...$args
  } else {
     ^sail ...$args
  }
}

# Run php artisan commands (in Sail or local)
def --wrapped artisan [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail artisan ...$args
  } else {
    php artisan ...$args
  }
}

# Run php please commands (in Sail or local)
def --wrapped please [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail php please ...$args
  } else {
    php please ...$args
  }
}

# Run composer commands (in Sail or local)
def --wrapped composer [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail composer ...$args
  } else {
    ^composer ...$args
  }
}

# Run pnpm commands (in Sail or local)
def --wrapped pnpm [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail pnpm ...$args
  } else {
    ^pnpm ...$args
  }
}

# Run npm commands (in Sail or local)
def --wrapped npm [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail npm ...$args
  } else {
    ^npm ...$args
  }
}

# Run yarn commands (in Sail or local)
def --wrapped yarn [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail yarn ...$args
  } else {
    ^yarn ...$args
  }
}

# Open file(s) with $EDITOR
def --wrapped editor [...args] {
  let cmd = $env.EDITOR | first
  let flags = $env.EDITOR | drop nth 0
  run-external $cmd ...$flags ...$args
}

# Open file(s) with $VISUAL
def --wrapped visual [...args] {
  let cmd = $env.VISUAL | first
  let flags = $env.VISUAL | drop nth 0
  run-external $cmd ...$flags ...$args
}

alias c        = ^chezmoi
alias e        = editor
alias j        = just --highlight
alias lazynvim = nvim --headless "+Lazy! sync" +qa
alias lag       = lazygit
alias sail     = vendor/bin/sail
alias v        = ^$env.VISUAL
alias q        = ^pueue
alias chezomi  = ^chezmoi
alias chemzoi  = ^chezmoi
alias marked = ^open -a "Marked"
alias aliases = e ($nu.default-config-dir | path join scripts aliases.nu)
alias lad = lazydocker
