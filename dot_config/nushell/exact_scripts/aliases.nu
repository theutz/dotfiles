use chezmoi

export alias c       = ^chezmoi
export alias e        = ^$env.EDITOR
export alias j        = just --highlight
export alias lazynvim = nvim --headless "+Lazy! sync" +qa
export alias lg       = lazygit
export alias sail     = vendor/bin/sail
export alias v        = ^$env.VISUAL

# Start yazi file manager with cd on exit
export def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

export def --wrapped artisan [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail artisan ...$args
  } else {
    php artisan ...$args
  }
}

export def --wrapped please [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail php please ...$args
  } else {
    php please ...$args
  }
}

export def --wrapped composer [...args] {
  if ('vendor/bin/sail' | path exists) {
    print -e "🐳 Running in docker..."
    vendor/bin/sail composer ...$args
  } else {
    ^composer ...$args
  }
}
