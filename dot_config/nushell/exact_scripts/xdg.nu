# Construct an absolute path from XDG_RUNTIME_DIR
export def runtime [
  ...segments: string # path segments to join
]: list<string> -> string {
  $env.XDG_RUNTIME_DIR
    | default ($env.TMPDIR)
    | path join ...$segments
}

# Construct an absolute path from XDG_CACHE_HOME
export def cache [
  ...segments: string # path segments to join
]: list<string> -> string {
  $env.XDG_CACHE_HOME
    | default ([$env.HOME .cache])
    | path join ...$segments
}

# Construct an absolute path from XDG_STATE_HOME
export def state [
  ...segments: string # path segments to join
]: list<string> -> string {
  $env.XDG_STATE_HOME
    | default ([$env.HOME .local state])
    | path join ...$segments
}

# Construct an absolute path from XDG_DATA_HOME
export def data [
  ...segments: string # path segments to join
]: list<string> -> string {
  $env.XDG_DATA_HOME
    | default ([$env.HOME .local share])
    | path join ...$segments
}

# Construct an absolute path from XDG_CONFIG_HOME
export def config [
  ...segments # path segments to join
]: list<string> -> string {
  $env.XDG_CONFIG_HOME
    | default [$env.HOME .config]
    | path join ...$segments
}

# Commands for working with standard XDG paths
export def main [] {
  help main
}
