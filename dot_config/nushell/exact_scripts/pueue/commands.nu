def "nu-complete config pueue target" [] {
    [
      [value description];
      [nu-config ($nu.default-config-dir | path join scripts pueue)]
    ]
  }

export def "config pueue" [
  target?: string@"nu-complete config pueue target" # The file to edit
] {
  let file = (
    nu-complete config pueue target
    | where value == ($target | default "nu-config")
    | get description.0
  )
  run-external $env.EDITOR $file
}
