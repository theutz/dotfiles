export-env {
  use ~/.cache/starship/init.nu

  $env.config.hooks.pre_prompt = ($env.config.hooks.pre_prompt | append {||
    let overlays = overlay list | range 1..
    if ($overlays | is-not-empty) {
      $env.NU_OVERLAYS = ($overlays | str join ", ")
    } else {
      $env.NU_OVERLAYS = null
    }
  })
}

# Configure starship prompt
export def "config starship" [
  --nushell-module (-n) # Open nushell module instead
] {
  let file = if $nushell_module {
    ($nu.default-config-dir | path join scripts starship.nu)
  } else {
    ($env.XDG_CONFIG_HOME | path join starship.toml)
  }
  run-external $env.EDITOR $file
}
