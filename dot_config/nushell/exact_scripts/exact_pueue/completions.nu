export def "nu-complete pueue color" [] {
  [
    [value description];
    [auto "enables color output when connected to a tty [default]"]
    [never ""]
    [always ""]
  ]
}

export def "nu-complete pueue groups" [] {
  ^pueue group --json | from json | items {|key| $key }
}

export def "nu-complete pueue tasks" [] {
  (^pueue status --json
    | from json
    | get tasks
    | values
    | inspect
    | each {|x|
        { value: $x.id, description: $"[($x.status)] ($x.original_command)"}
      }
  )
}

export def "nu-complete pueue statuses" [] {
  [running paused stashed queued failed success]
}

export def "nu-complete pueue shells" [] {
  [bash elvish fish power-shell zsh]
}

export def "nu-complete config pueue target" [] {
    [
      [value description];
      [nu-config ($nu.default-config-dir | path join scripts pueue)]
    ]
  }

