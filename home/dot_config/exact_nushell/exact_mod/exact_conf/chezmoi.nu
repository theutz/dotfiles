# Edit chezmoi files

# Edit all chezmoi files
export def "main" [] {
  src-edit
}

# Edit files in .chezmoiscripts
export def "scripts" [] {
  src-edit ".chezmoiscripts"
}

# Edit files in .chezmoidata
export def "data" [] {
  src-edit ".chezmoidata"
}
