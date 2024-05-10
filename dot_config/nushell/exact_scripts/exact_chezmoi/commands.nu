# Open chezmoi module config in EDITOR
export def "config chezmoi" [] {
  run-external $env.EDITOR ($nu.default-config-dir | path join scripts chezmoi)
}

# Get the status of files managed by chezmoi
export def "chezmoi status+" [] {
  ^chezmoi status
  | from ssv -m 1 -n
  | rename status path
}

def paths-from-home [] {
  each {|it| $env.HOME | path join $it.path }
}

# Add all files marked for deletion
export def "chezmoi add-exact" [] {
  (
    chezmoi status+ | where status == D
    | if ($in | is-empty) { print -e "No files to add."; return } else { $in }
    | paths-from-home
    | ^chezmoi add --interactive ...$in
  )
}

# Forget any files that have been deleted
export def "chezmoi forget-deleted" [] {
  (
    chezmoi status+ | where status == DA
    | if ($in | is-empty) { print -e "No files to delete."; return } else { $in }
    | paths-from-home
    | ^chezmoi forget --interactive ...$in
  )
}

# Re-add files, add exact files, and forget deleted files
export def "chezmoi sync" [] {
  ^chezmoi re-add --interactive
  chezmoi add-exact
  chezmoi forget-deleted
}
