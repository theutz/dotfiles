export def mode [] {
  [
    file
    symlink
  ]
}

export def config-format [] {
  [
    json
    toml
    yaml
  ]
}

export def bool-or-auto [] {
  [
    on
    off
    auto
  ]
}

export def secrets [] {
  [
    [value   description];
    [ignore  ""]
    [warning "default"]
    [error   ""]
  ]
}

export def types [] {
  const positive = [
    [value       description];
    ["all"       "All entries"]
    ["none"      "No entries"]
    ["dirs"      "Directories"]
    ["files"     "Files"]
    ["remove"    "Removes"]
    ["scripts"   "Scripts"]
    ["symlinks"  "Symbolic links"]
    ["always"    "Scripts that are always run"]
    ["encrypted" "Encrypted entries"]
    ["externals" "External entries"]
    ["templates" "Templates"]
  ]

  let negative = $positive | each {
    |x| {
      value: $"no($x.value)",
      description: $"Exclude ($x.description | str downcase)"
    }
  }

  $positive | append $negative
}

export def path-style [] {
  [
    absolute
    relative
    source-absolute
    source-relative
  ]
}
