# Edit window manager nushell module
export def "edit nu" [] {
  run-external $env.EDITOR ($nu.default-config-dir | path join scripts wm)
}

# Commands for working with the window manager
export def main [] {
  help wm
}
