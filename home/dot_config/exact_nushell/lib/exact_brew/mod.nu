export def list [...args] {
  if ($args | is-empty) {
    ^brew list | lines
  } else {
    ^brew list ...$args
  }
}

export module aliases {
  export alias brewi = ^brew install
  export alias brews = list
}
