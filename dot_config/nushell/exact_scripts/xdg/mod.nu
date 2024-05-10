# Construct an absolute path from XDG_RUNTIME_DIR
export def "xdg runtime" [
  ...segments # path segments to join
]: list<string> -> string {
  let base = $env.XDG_RUNTIME_DIR | default ($env.TMPDIR)
  $segments | prepend $base | path join
}

# Construct an absolute path from XDG_CACHE_HOME
export def "xdg cache" [
  ...segments # path segments to join
]: list<string> -> string {
  let base = $env.XDG_CACHE_HOME | default ($env.HOME | path join .cache)
  $segments | prepend $base | path join
}

# Construct an absolute path from XDG_STATE_HOME
export def "xdg state" [
  ...segments # path segments to join
]: list<string> -> string {
  let base = $env.XDG_STATE_HOME | default ($env.HOME | path join .local state)
  $segments | prepend $base | path join
}

# Construct an absolute path from XDG_DATA_HOME
export def "xdg data" [
  ...segments # path segments to join
]: list<string> -> string {
  let base = $env.XDG_DATA_HOME | default ($env.HOME | path join .local share)
  $segments | prepend $base | path join
}

# Construct an absolute path from XDG_CONFIG_HOME
export def "xdg config" [
  ...segments # path segments to join
]: list<string> -> string {
  let base = $env.XDG_CONFIG_HOME | default ($env.HOME | path join .config)
  $segments | prepend $base | path join
}

# Commands for working with standard XDG paths
export def main [] {
  help xdg
}
