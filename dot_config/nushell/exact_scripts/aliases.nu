use chezmoi

export alias artisan = php artisan
export alias brewh   = brew info
export alias brewi   = brew install
export alias brewps  = brew services+
export alias brewpsa = brew services+ --all
export alias brews   = brew search
export alias breww   = brew home
export alias brewx   = brew uninstall
export alias caskh   = brew info --cask
export alias caski   = brew install --cask
export alias casks   = brew search --cask
export alias caskw   = brew home --cask
export alias caskx   = brew uninstall --cask
export alias cm      = ^chezmoi
export alias cma     = ^chezmoi add
export alias cmae    = chezmoi add-exact
export alias cmap    = ^chezmoi apply --interactive
export alias cmd     = ^chezmoi diff
export alias cme     = ^chezmoi edit
export alias cmf     = ^chezmoi forget
export alias cmfd    = chezmoi forget-deleted
export alias cmls    = chezmoi managed+
export alias cmm     = ^chezmoi merge
export alias cmma    = ^chezmoi merge-all
export alias cmra    = ^chezmoi re-add --interactive
export alias cmrm    = ^chezmoi remove
export alias cms     = chezmoi status+
export alias cmS     = chezmoi sync
export alias e       = ^$env.EDITOR
export alias gf      = git fetch
export alias gfm     = git pull
export alias gwS     = git status
export alias gws     = git status --short
export alias j       = just --highlight
export alias lg      = lazygit
export alias sail    = vendor/bin/sail
export alias tmuxa   = tmux attach-session
export alias tmuxl   = tmux ls+
export alias tx      = tmux
export alias txa     = tmux attach
export alias txls    = tmux ls+
export alias txp     = tmuxp
export alias txpe    = tmuxp edit+
export alias txpl    = tmuxp load+
export alias txpls   = tmuxp ls+
export alias txpp    = tmuxp pick
export alias txps    = tmuxp switch
export alias txx     = tmux kill-session+
export alias v       = ^$env.VISUAL
export alias y       = yabai
export alias please  = php please

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
