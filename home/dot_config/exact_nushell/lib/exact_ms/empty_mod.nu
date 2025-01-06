# Tools for working with mise-en-place

# Search for packages in mise
export def search [
  query?: string
] {
  let q = if ($query | is-empty) {
    input "query: "
  } else {
    $query
  }

  let aqua = ^aqua list --all
  | lines -s |
  | split column "," registry repo
  | get repo
  | where name =~ $q
  | each {|| upsert registry "aqua" }

  let npm = ^npm search $q --json
  | from json
  | get name
  | each {|| upsert registry "npm" }

  [
    ...$aqua
    ...$npm
  ]
}

# Search for packages
export alias s = search

export module aliases {
  # Search for pacakges in mise
  export alias mss = search
}

