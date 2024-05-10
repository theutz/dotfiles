# Open chezmoi module config in EDITOR
export def "config chezmoi" [] {
  run-external $env.EDITOR ($nu.default-config-dir | path join scripts chezmoi)
}

# Get the status of files managed by chezmoi
export def "chezmoi status" [] {
  ^chezmoi status
  | from ssv -m 1 -n
  | rename status path
}

# Add all files marked for deletion
export def "chezmoi add-deleted" [] {
  (
    chezmoi status
    | where status == D
    | if ($in | length) <= 0 { print "No files to add."; return } else { $in }
    | each {|x| $env.HOME | path join $x.path }
    | inspect
    | ^chezmoi add ...$in
  )
}
