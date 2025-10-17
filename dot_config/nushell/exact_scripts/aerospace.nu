# List monitors
export def list-monitors [] {
  ^aerospace list-monitors --json | from json | rename --block { str replace "monitor-" "" }
}

# List all workspaces
export def list-workspaces [] {
  ^aerospace list-workspaces --all --json | from json | get workspace
}

export const list_windows_filters = [focused monitor workspace all]

# List all windows
export def list-windows [
  --filter (-f): string@$list_windows_filters
] {
  if ($filter | is-empty) {
    $list_windows_filters | input list "How would you like those filtered?"
  } else { $filter }
  | match ($in) {
    focused => [--focused]
    monitor => {
      [focused mouse all] | each { {id: $in, name: $in} } | append (list-monitors)
      | input list --display name "Which monitor would you like to see?"
      | [--monitor $in.id]
    }
    workspace => {
      [focused visible] | append (list-workspaces)
      | input list "Which workspace would you like to see?"
      | [--workspace $in]
    }
    all => [--all]
  }
  | ^aerospace list-windows ...$in --json
  | from json
}

# List all applications
export def list-apps [...args] {
  ^aerospace list-apps --json | from json | rename --block { str replace "app-" "" }
}

@complete external
export extern main []
