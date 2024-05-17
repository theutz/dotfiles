# Edit commands for the wm module
export def main [] {
  enter ($nu.default-config-dir | path join scripts wm)
  run-external $env.EDITOR .
  n
}
