# Tools for working with chezmoi

export def status [] {
  ^chezmoi status
  | parse --regex '(?m)^(?P<last>.)(?P<target>.) (?P<file>.*$)'
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
  export alias cmm   = ^chezmoi merge
  export alias cmma  = ^chezmoi merge-all
  export alias cmra  = ^chezmoi re-add
  export alias cmrai = ^chezmoi re-add --interactive
  export alias cms   = status
  export alias cmx   = ^chezmoi destroy
  export alias cmy   = ^chezmoi apply
}

