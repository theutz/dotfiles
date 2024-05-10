export def "config yabai" [] {
  run-external $env.EDITOR ($env.HOME | path join .config yabai yabairc)
}
