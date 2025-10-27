# Helper module for working with launchctl

def "fetch domain" []: int -> string {
  try {
    sudo launchctl procinfo $in
    | find --no-highlight --regex ^\s+domain
    | first
    | str replace --regex '^\s+domain = (?<domain>\S+).*$' '$domain'
  } catch {|e|
    $e | print -e
    null
  }
}

# Get relevant info about a running service
export def info [
  query?: string # Part or all of a service label to search for
] {
  $query
  | if ($in | is-empty) {
    list | input list --display label --fuzzy "Which service?" | get label
  } else {
    $in
  }
  | do {|q| list | where label =~ $q } $in
  | match ($in | length) {
    0 => { error make { msg: $"No service matches ($in)" } }
    1 => { first }
    _ => { input list --display label --fuzzy "Which service?" }
  }
  | upsert domain {|it|
    match $it {
      null | { domain: _, pid: null } => null
      { domain: $domain, pid: _ } if $domain != null => $domain
      _ => { $it.pid | fetch domain }
    }
  }
  | move domain --after label
  | insert target {|it|
    if ($it.domain | is-empty) { $it.domain } else {
      $"($it.domain)/($it.label)"
    }
  }
  | move target --after domain
}

export alias i = info

# List all launchctl services
export def list [
  --domain (-d) # fetch domains for services (slow)
  --active (-a) # Only show active services
] {
  [(run-external launchctl list) (sudo launchctl list)]
  | each { detect columns }
  | flatten
  | rename --block { str downcase }
  | update pid { if $in == "-" { null } else { into int } }
  | update status { into int }
  | insert active {|in| $in.pid != null }
  | insert last_signal {|row| if $row.status < 0 { $row.status | math abs } else { null } }
  | select label active pid status last_signal
  | rename --column { status: last_status }
  | if ($active or $domain) { where active } else { $in }
  | if ($domain) {
    insert domain {
       get -o pid | match $in { null => $in, _ => { fetch domain } }
    }
    | move domain --after label
  } else { $in }
  | collect
}

export alias ls = list

def active-labels []: nothing -> list<string> { list --active | get name }

export def restart [service?: string@active-labels] {
  info $service | get target | sudo launchctl kickstart -k $in
}

# Show module help
export def main [] {
  help modules lctl
}
