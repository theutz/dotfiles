use xdg ["xdg config"]

export def "config skhd" [
  --nushell-config (-n) # configure nushell module
] {
  let path = if $nushell_config {
    [$nu.default-config-dir scripts yabai mod.nu]
  } else {
    [(xdg config) skhd skhdrc]
  } | path join

  run-external $env.EDITOR $path
}
