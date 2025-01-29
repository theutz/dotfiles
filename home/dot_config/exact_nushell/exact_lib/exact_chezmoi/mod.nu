# Tools for working with chezmoi

export def status [] {
  ^chezmoi status
  | parse --regex '(?m)^(?P<last>.)(?P<target>.) (?P<file>.*$)'
  | upsert file { $"~/($in)" }
  | upsert source {|it| ^chezmoi source-path $it.file | path relative-to (^chezmoi source-path) }
}

# Add path(s) to .chezmoiignore
export def ignore [...path: path]: nothing -> nothing {
  $path
  | path relative-to $env.HOME
  | to text
  | save -a ~/.local/share/chezmoi/home/.chezmoiignore
}

export def --wrapped re-add [...args] {
  if ($args | is-empty) {
    status
    | where last == M and target == M
    | input list --multi --display file
    | get file
    | ^chezmoi re-add ...$in
  } else {
    ^chezmoi re-add ...$args
  }
}

# List all managed files
export def ls [path?: string] {
  if ($path | is-empty) {
    $env.PWD
  } else {
    if ($path | str starts-with "/") or ($path | str starts-with "~") {
      $path | path expand
    } else {
      [$env.PWD $path] | path join
    }
  }
  | ^chezmoi managed --include "files,symlinks" --path-style all ($in)
  | from json
  | transpose
  | flatten -a
  | rename target
}

export module aliases {
  export alias cm    = ^chezmoi
  export alias cma   = ^chezmoi add
  export alias cmcd  = ^chezmoi cd
  export alias cmch  = ^chezmoi chattr
  export alias cmchd = ^chezmoi chattr -- +exact
  export alias cmchD = ^chezmoi chattr -- -exact
  export alias cmche = ^chezmoi chattr -- +encrypted
  export alias cmchE = ^chezmoi chattr -- -encrypted
  export alias cmcht = ^chezmoi chattr -- +template
  export alias cmchT = ^chezmoi chattr -- -template
  export alias cmd   = ^chezmoi diff
  export alias cme   = ^chezmoi edit
  export alias cmea  = ^chezmoi edit --apply
  export alias cmew  = ^chezmoi edit --watch
  export alias cmf   = ^chezmoi forget
  export alias cmgws = ^chezmoi git status --short
  export alias cmls  = ls
  export alias cmm   = ^chezmoi merge
  export alias cmma  = ^chezmoi merge-all
  export alias cmra  = ^chezmoi re-add
  export alias cmrai = ^chezmoi re-add --interactive
  export alias cms   = status
  export alias cmx   = ^chezmoi destroy
  export alias cmy   = ^chezmoi apply
}

