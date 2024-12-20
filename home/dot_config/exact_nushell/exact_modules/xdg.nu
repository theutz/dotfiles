# join file paths with XDG bases
export def main [] {}

# join with XDG_CONFIG_HOME (~/.config)
export def config [
  ...paths: string
] path -> path {
  [
    ($env.XDG_CONFIG_HOME? | default
      ($env.HOME | path join ".config"))
    ($in | default "")
    ...$paths
  ]
    | where $it != ""
    | path join
}

# join with XDG_DATA_HOME (~/.local/share)
export def data [
  ...paths: string
] path -> path {
  [
    ($env.XDG_DATA_HOME? | default
      ($env.HOME | path join ".local" "share"))
    ($in | default "")
    ...$paths
  ]
    | where $it != ""
    | path join
}

# join with XDG_STATE_HOME (~/.local/state)
export def state [
  ...paths: string
] path -> path {
  [
    ($env.XDG_STATE_HOME? | default
      ($env.HOME | path join ".local" "state"))
    ($in | default "")
    ...$paths
  ]
    | where $it != ""
  |inspect
    | path join
}

# join with XDG_CACHE_HOME (~/.cache)
export def cache [
  ...paths: string
] path -> path {
  [
    ($env.XDG_CACHE_HOME? | default
      ($env.HOME | path join ".cache"))
    ($in | default "")
    ...$paths
  ]
    | where $it != ""
    | path join
}

# join with XDG_RUNTIME_DIR ($TMPDIR)
export def runtime [
  ...paths: string
] path -> path {
  [
    ($env.XDG_RUNTIME_DIR? | default $env.TMPDIR)
    ($in | default "")
    ...$paths
  ]
    | where $it != ""
    | path join
}

# join with ~/.local/bin
export def bin [
  ...paths: string
] path -> path {
  [
    $env.HOME
    ".local"
    "bin"
    ($in | default "")
    ...$paths
  ]
    | where $it != nil
    | path join
}

