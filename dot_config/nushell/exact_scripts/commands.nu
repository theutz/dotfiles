# List all aliases
export def aliases [] {
  chezmoi edit ([$env.NU_LIB_DIRS.0 aliases.nu] | str join (char psep))
}

# Open file(s) in the default editor
export def editor [...args: string] string -> nothing {
  run-external $env.EDITOR $in ...args
}

# Start yazi file manager with cd on exit
def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}
