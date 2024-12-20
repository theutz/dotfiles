# join file paths with XDG bases
export def main [] {}

def build [] list<string> -> path {
  compact --empty | path join
}

# join with XDG_CONFIG_HOME (~/.config)
export def config [
  ...args: string
] path -> path {
  let base = ($env.XDG_CONFIG_HOME? | default
      ($env.HOME | path join ".config"))
  [$base $in ...$args ] | build
}

# join with XDG_DATA_HOME (~/.local/share)
export def data [
  ...args: string
] path -> path {
  let base = ($env.XDG_DATA_HOME? | default
      ($env.HOME | path join ".local" "share"))
  [$base $in ...$args] | build
}

# join with XDG_STATE_HOME (~/.local/state)
export def state [
  ...args: string
] path -> path {
  let base = ($env.XDG_STATE_HOME? | default
      ($env.HOME | path join ".local" "state"))
  [$base $in ...$args] | build
}

# join with XDG_CACHE_HOME (~/.cache)
export def cache [
  ...args: string
] path -> path {
  let base = ($env.XDG_CACHE_HOME? | default
      ($env.HOME | path join ".cache"))
  [$base $in ...$args] | build
}

# join with XDG_RUNTIME_DIR ($TMPDIR)
export def runtime [
  ...args: string
] path -> path {
  let base = $env.XDG_RUNTIME_DIR? | default $env.TMPDIR
  [$base $in ...$args] | build
}

# join with ~/.local/bin
export def bin [
  ...args: string
] path -> path {
  let base = $env.HOME | path join ".local" "bin"
  [$base $in ...$args] | build
}

