use xdg ["xdg config"]

export def "config yabai" [
  --nushell-config (-n) # configure nushell module
] {
  let path = if $nushell_config {
    [$nu.default-config-dir scripts yabai mod.nu]
  } else {
    [(xdg config) yabai yabairc]
  } | path join

  run-external $env.EDITOR $path
}
