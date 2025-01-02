# Edit chezmoi files

# Edit all chezmoi files
export def "main" [] {
  ^chezmoi source-path | str trim | path join | ^$env.EDITOR $in
}

# Edit files in .chezmoiscripts
export def "scripts" [] {
  ^chezmoi source-path | str trim | path join .chezmoiscripts | ^$env.EDITOR $in
}

# Edit files in .chezmoidata
export def "data" [] {
  ^chezmoi source-path | str trim | path join .chezmoidata | ^$env.EDITOR $in
}
