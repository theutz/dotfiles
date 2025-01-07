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

  let aqua = {|| ^aqua list --all
    | lines -s |
    | split column "," registry name
    | where name =~ $q
    | each {|| upsert registry "aqua" }
    | insert points (1e20 | into int)
  }

  let npm = {|| ^npm search $q --json --searchlimit 250
    | from json
    | par-each {|p|
      {
        scheme: https,
        host: api.npmjs.org,
        path: $"downloads/point/last-year/($p.name | default "")"
      } | url join | http get $in
      | rename -c {package: name, downloads: points}
      | reject start end
    }
    | insert registry "npm"
  }

  let asdf = {||
    ^gh search repos $"asdf-($q)" --match name --json fullName,stargazersCount
    | from json
    | rename -c {fullName: name, stargazersCount: points}
    | insert registry "asdf"
  }

  let go = {||
    ^gh search repos $q --language go --match name --json fullName,stargazersCount
    | from json
    | rename -c {fullName: name, stargazersCount: points}
    | insert registry "go"
  }

  let cargo = {||
    ^cargo search $q --limit 100
    | complete | get stdout
    | lines | drop 2 | str join (char newline)
    | parse -r '^(?P<name>\S+?)\s+=\s+"(?P<version>\S+?)"\s+#\s+(?P<description>.*)'
    | par-each {|c|
      { scheme: https, host: crates.io, path: $"api/v1/crates/($c.name)" }
      | url join | http get $in | get crate
      | select -i name downloads
      | rename -c {downloads: points}
    }
    | insert registry cargo
  }

  let gems = {||
    ^gem search $q | complete | get stdout
		| parse -r '(?P<name>\S+)\s+\((?P<version>\S+)\)'
    | par-each {|g|
      { scheme: https, host: rubygems.org, path: $"api/v1/gems/($g.name)" }
      | url join | http get $in
      | select -i name downloads
      | rename -c {downloads: points}
    }
    | insert registry gem
  }

  let pip = {||
    let headers = [
      Accept "application/vnd.pypi.simple.v1+json"
      Host "pypi.org"
    ]

    {
      scheme: https,
      host: files.pythonhosted.org,
      path: simple
    } | url join | http get --headers $headers $in
    | from json | get projects | select name
    | where name =~ $q
    | par-each {|p|
      { scheme: https, host: pypistats.org, path: $"api/packages/($p.name | default "")/overall" }
      | url join | http get $in
      | get -i data.downloads | default [0] | math sum
      | {name: $p.name?, points: $in}
    }
    | insert registry pip
  }

  [
    $aqua
    $npm
    $asdf
    $cargo
    $gems
    $go
    $pip
  ]
  | par-each {|closure|
    try {
      do $closure
    } catch { [] }
  }
  | flatten | sort-by points
  | select name points registry
}

# Search for packages
export alias s = search

export module aliases {
  # Search for pacakges in mise
  export alias mss = search
}

