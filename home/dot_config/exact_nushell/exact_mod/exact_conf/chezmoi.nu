# Edit chezmoi files

def edit [...file: string] {
  let f = ^chezmoi source-path | str trim | path join ...$file

  ^$env.EDITOR $f | complete
  | if $in.exit_code == 0 { 
    chezmoi apply $f
  }
}

# Edit all chezmoi files
export def "main" [] {
  edit
}

# Edit files in .chezmoiscripts
export def "scripts" [] {
  edit .chezmoiscripts
}

# Edit files in .chezmoidata
export def "data" [] {
  edit .chezmoidata
}

# Edit the fonts file
export def "fonts" [] {
  edit .chezmoidata fonts.yml
}
