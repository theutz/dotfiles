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
  --target (-t) # Output result as a service target
  --sudo (-s) # Run as super-user
] {
  $query
  | if ($in | is-empty) {
    list --sudo=$sudo | input list --display label --fuzzy "Which service?" | get label
  } else {
    $in
  }
  | do {|q| list --sudo=$sudo | where label =~ $q } $in
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
  | if ($target) { into target } else { $in }
}

export alias i = info

# List all launchctl services
export def list [
  --sudo (-s) # run as super-user
  --domain (-d) # fetch domains for services (slow)
  --active (-a) # Only show active services
] {
  [launchctl list]
  | if ($sudo) { prepend [sudo] } else { $in }
  | run-external ...$in
  | detect columns
  | rename --block { str downcase }
  | update pid { if $in == "-" { null } else { into int } }
  | update status { into int }
  | insert active {|in| $in.pid != null }
  | insert last_signal {|row| if $row.status < 0 { $row.status | math abs } else { null } }
  | select label active pid status last_signal
  | rename --column { status: last_status }
  | if ($active) { where active } else { $in }
  | if ($domain) {
    insert domain {
       get -o pid | match $in { null => $in, _ => { fetch domain } }
    }
    | move domain --after label
  } else { $in }
  | collect
}

export alias ls = list

export def "into target" []: record<label: string, domain: string> -> string {
  $"($in.domain)/($in.label)"
}

# Show module help
export def main [] {
  help modules lctl
}
