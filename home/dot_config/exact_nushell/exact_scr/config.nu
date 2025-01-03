# Edit wezterm configurations.
def "config wezterm" [] {
  ^chezmoi edit --watch (
    $env.XDG_CONFIG_HOME? | default "~/.config"
    | path join "wezterm/wezterm.lua"
  )
}

# Edit nu configurations.
def "config nu" [] {
  ^chezmoi edit --watch $nu.config-path
  exec nu
}

# Edit nu environment configurations.
def "config env" [] {
  ^chezmoi edit --watch $nu.env-path
  exec nu
}
