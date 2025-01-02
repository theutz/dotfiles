# Edit chezmoi files

def edit [...file: string] {
  ^chezmoi source-path | str trim
  | path join ...$file
  | ^$env.EDITOR $in
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
  edit .chezmoiscripts fonts.yml
}
