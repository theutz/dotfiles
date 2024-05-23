# Construct an absolute path from XDG_CONFIG_HOME
export def config [
  ...path: string # The path segments to join
] -> string {
  $env.XDG_CONFIG_HOME | default [$env.HOME .config]
    | path join ...$path
}

# Construct an absolute path from XDG_CACHE_HOME
export def cache [
  ...path: string
] -> string {
  $env.XDG_CACHE_HOME
    | default ([$env.HOME .cache])
    | path join ...$path
}

# Construct an absolute path from XDG_DATA_HOME
export def data [
  ...path: string
] -> string {
  $env.XDG_DATA_HOME
    | default ([$env.HOME .local state])
    | path join ...$path
}

# Construct an absolute path from XDG_STATE_HOME
export def state [
  ...path: string
] -> string {
  $env.XDG_STATE_HOME
    | default ([$env.HOME .local state])
    | path join ...$path
}

# Construct an absolute path from XDG_RUNTIME_DIR
export def runtime [
  ...path: string
] -> string {
  $env.XDG_RUNTIME_DIR
    | default ([$env.HOME .local state])
    | path join ...$path
}
