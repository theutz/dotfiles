# Edit window manager nushell module
export def nu [] {
  run-external $env.EDITOR ($nu.default-config-dir | path join scripts wm)
}
