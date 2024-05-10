export def "config skhd" [
  --nushell-config (-n) # configure nushell module
] {
  let path = if $nushell_config { [$env.XDG_CONFIG_HOME] }
  let files = [
    [$env.XDG_CONFIG_HOME skhd skhdrc]
    [$nu.default-config-dir scripts yabai mod.nu]
  ] | each { path join }

  run-external $env.EDITOR ...$files
}
