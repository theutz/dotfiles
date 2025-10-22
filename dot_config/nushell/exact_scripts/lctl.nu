# Helper module for working with launchctl

def "fetch domain" []: int -> string {
  sudo launchctl procinfo $in
  | find --no-highlight --regex ^\s+domain
  | first
  | parse --regex '\s+domain = (?<domain>\S+?)\s.*$'
  | get --optional domain.0
}

# Get relevant info about a running service
export def info [
  query?: string # Part or all of a service label to search for
  --target (-t) # Output result as a service target
] {
  $query
  | if ($in | is-empty) {
    list | input list --display label --fuzzy "Which service?" | get label
  } else {
    $in
  }
  | do {|q| list | where label =~ $q } $in
  | match ($in | length) {
    0 => { print -e $"No service matches ($in)"; exit 1 }
    1 => { first }
    _ => { input list --display label --fuzzy "Which service?" }
  }
  | upsert domain { match $in {
    { domain: _, pid: null } => null
    { domain: $domain, pid: _ } if $domain != null => $domain
    _ => { get pid | fetch domain }
  } }
  | if ($target) { into target } else { $in }
}

export alias i = info

# List all launchctl services
export def list [
  --sudo (-s) # run as super-user
  --domain (-d) # fetch domains for active services (slow)
] {
  [launchctl list]
  | if ($sudo) { prepend [sudo] } else { $in }
  | run-external ...$in
  | detect columns
  | rename --block { str downcase }
  | update pid { if $in == "-" { null } else { into int } }
  | update status { into int }
  | insert active {|in| $in.pid != null }
  | if ($domain) {
    insert domain {|in| 
       $in.pid | match $in { null => $in, _ => { fetch domain } }
    }
  } else { $in }
  | insert last_signal {|row| if $row.status > 0 { $row.status | math abs } else { null } }
  | select label domain active pid status last_signal
}

export alias ls = list

export def "into target" []: record<label: string, domain: string> -> string {
  $"($in.domain)/($in.label)"
}

# Show module help
export def main [] {
  help modules lctl
}
