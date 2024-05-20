use completions.nu * 

# Get the status of files managed by chezmoi
export def status+ [] {
  ^chezmoi status
  | from ssv -m 1 -n
  | rename status path
}

def paths-from-home [] {
  each {|it| $env.HOME | path join $it.path }
}

# Add all files marked for deletion
export def add-exact [] {
  (
    chezmoi status+ | where status == D
    | if ($in | is-empty) { print -e "No files to add."; return } else { $in }
    | paths-from-home
    | ^chezmoi add --interactive ...$in
  )
}

# Forget any files that have been deleted
export def forget-deleted [] {
  (
    status+ | where status == DA
    | if ($in | is-empty) { print -e "No files to delete."; return } else { $in }
    | paths-from-home
    | ^chezmoi forget --interactive ...$in
  )
}

# Re-add files, add exact files, and forget deleted files
export def sync [] {
  ^chezmoi re-add --interactive
  add-exact
  forget-deleted
  ^chezmoi apply --refresh-externals
}

# List managed files using nushell goodies
export def "managed+" [...args] {
  ^chezmoi managed ...$args | from ssv -n | rename path
}
