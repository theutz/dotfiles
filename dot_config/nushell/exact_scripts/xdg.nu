# Definition

# #+name: xdg-config

# [[file:../nushell.org::xdg-config][xdg-config]]
# Construct an absolute path from XDG_CONFIG_HOME
export def config [
  ...path: string # The path segments to join
] -> string {
  $env.XDG_CONFIG_HOME | default [$env.HOME .config]
    | path join ...$path
}
# xdg-config ends here

# Definition

# #+name: xdg-cache

# [[file:../nushell.org::xdg-cache][xdg-cache]]
# Construct an absolute path from XDG_CACHE_HOME
export def cache [
  ...path: string
] -> string {
  $env.XDG_CACHE_HOME
    | default ([$env.HOME .cache])
    | path join ...$path
}
# xdg-cache ends here

# Definition

# #+name: xdg-data

# [[file:../nushell.org::xdg-data][xdg-data]]
# Construct an absolute path from XDG_DATA_HOME
export def data [
  ...path: string
] -> string {
  $env.XDG_DATA_HOME
    | default ([$env.HOME .local state])
    | path join ...$path
}
# xdg-data ends here

# Definition

# #+name: xdg-state

# [[file:../nushell.org::xdg-state][xdg-state]]
# Construct an absolute path from XDG_STATE_HOME
export def state [
  ...path: string
] -> string {
  $env.XDG_STATE_HOME
    | default ([$env.HOME .local state])
    | path join ...$path
}
# xdg-state ends here

# Definition

# #+name: xdg-runtime

# [[file:../nushell.org::xdg-runtime][xdg-runtime]]
# Construct an absolute path from XDG_RUNTIME_DIR
export def runtime [
  ...path: string
] -> string {
  $env.XDG_RUNTIME_DIR
    | default ([$env.HOME .local state])
    | path join ...$path
}
# xdg-runtime ends here
