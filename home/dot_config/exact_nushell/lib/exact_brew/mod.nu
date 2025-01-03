export def --wrapped list [...args] {
  match $args {
    ["--cask"] | [] => { ^brew list | lines },
    _ => { ^brew list ...$args }
  }
}

export module aliases {
  export alias brewh = ^brew home
  export alias brewi = ^brew install
  export alias brews = list
  export alias brewx = ^brew uninstall
  export alias caskh = ^brew install --cask
  export alias caski = ^brew install --cask
  export alias caskx = ^brew uninstall --cask
  export alias casks = list --cask
}
