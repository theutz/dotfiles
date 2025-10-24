# Tools for working with homebrew services

def statuses [] {
  [started stopped error none]
}

def users [] {
  [root $env.USER]
}

# List all services
export def list [
  --status (-s): string@statuses # filter by status
  --not-status (-S): string@statuses # inverted filter by status
  --user (-u): string@users # filter by user
]: nothing -> table<name: string, status: string, user?: string, file: path, exit_code: int> {
  ^brew services "--json"
  | from json
  | update exit_code { try { into int } }
  | if (is-terminal --stdout) {
    do {|value|
      $value | columns | reduce --fold $value {|col, acc|
        $acc | update $col {|row|
          match ($row.status | ansi strip) {
            started => (ansi green)
            stopped => (ansi yellow)
            error => (ansi red)
            none => (ansi dark_gray_dimmed)
            _ => (ansi default)
          } | [$in ($row | get $col) (ansi reset)] | str join
        }
      }
    } $in
  } else { $in }
  | if ($status | is-not-empty) { where status == $status } else { $in }
  | if ($not_status | is-not-empty) { where status != $user } else { $in }
  | if ($user | is-not-empty) { where user == $user } else { $in }
}

# Show status of all services
export alias status = list

# List only stopped services
export def stopped []: nothing -> list<string> {
  list --not-status started | get name
}

# List inactive services
export alias inactive = stopped

# List only started services
export def started []: nothing -> list<string> {
  list --status started | get name
}

# List active services
export alias active = started

# List all services
export def all []: nothing -> list<string> {
  list | get name
}

# Get info about a specific service
export def info [service?: string@all]: nothing -> string {
  $service
  | default (all | input list --fuzzy "Which service?")
  | brew services info $in
}

# Start a service
export def start [service?: string@inactive]: nothing -> string {
  $service
  | default (inactive | input list --fuzzy "Which service?")
  | brew services start $in
}

# Stop a service
export def stop [service?: string@active]: nothing -> string {
  $service
  | default (active | input list --fuzzy "Which service?")
  | brew services stop $in
}

# Restart a service
export def restart [service?: string@active]: nothing -> string {
  $service
  | default (active | input list --fuzzy "Which service?")
  | brew services restart $in
}

# Kill a service
export def kill [service?: string@active]: nothing -> string {
  $service
  | default (active | input list --fuzzy "Which service?")
  | brew services kill $in
}

# Tools for working with homebrew services
#
# Type `brewctl` for information about subcommands
export def main []: nothing -> table {
  list
}
