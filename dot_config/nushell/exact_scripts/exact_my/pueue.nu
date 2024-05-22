# Status as table
export def status --wrapped [...args] {
  $args | filter {|x|
      $x != "--json" or $x != '-j'
    }
  | ^pueue status --json ...$args
  | from json
}

# Get a table of groups
export def groups [
  --running (-r) # Only groups that are running
  --tasks-running (-t) # Only groups with running tasks
] {
  if ($tasks_running) {
    tasks | get details | where status == Running | get group | do {||
      let running = $in
      groups | filter {|x| $x.name in $running}
    }
  } else if ($running) {
    groups | filter {|x| $x.details.status == Running}
  } else {
    status | get groups | transpose name details
  }
}

# Get a table of tasks
export def tasks [] {
  status | get tasks | transpose name details
}

# Get a table of groups with running tasks
export def running-groups [] {
  tasks | where status == Running
}

export def main --wrapped [...args] {
  ^pueue ...$args
}
