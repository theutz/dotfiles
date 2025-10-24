# Fancy logs for fancy boys

export-env {
  $env.LOG_LEVEL = 2
}

# Log a message
export def main [
  --type (-t): string = "log"
  ...msg: string
]: any -> any {
  let input = $in
  let out = $input | match ($in | describe -d | get type) {
    record | list | table => { to yaml }
    nothing => ""
    _ => { into string }
  }
  let text = [$out ...$msg] | compact | str join (char space)
  let level = $env.LOG_LEVEL? | default 2 | into int

  match ($type) {
    error | err | failure | fail | fatal => {color: (ansi red), level: 1}
    warn | warning => {color: (ansi yellow), level: 2}
    info => {color: (ansi blue), level: 3}
    debug | dump => {color: (ansi magenta), level: 4}
    trace | log => {color: (ansi dark_gray), level: 5}
    success | pass => {color: (ansi green), level: 1}
    _ => {color: (ansi default), level: 3}
  } | if ($in.level <= $level) { $in.color } else { return $input }
    | [
        $"(ansi attr_reverse)(ansi attr_bold)($in)"
        ($type | str upcase | fill --width 7 --alignment mr)
        $"(ansi reset_reverse)"
        ($msg | str join (char space))
        $"(ansi reset_bold)($out | if ($in | lines | length) > 1 { $"(char newline)($in)" } else { $in } | str trim --right)"
        $"(ansi reset)(char newline)"
      ]
  | str join (char space)
  | print -e

  $input
}

# Log an error
export def err [...msg: string]: any -> any {
  main -t error ...$msg
}

# Log a warning
export def warn [...msg: string]: any -> any {
  main -t warn ...$msg
}

# Log info
export def info [...msg: string]: any -> any {
  main -t info ...$msg
}

# Log a failuree
export def fail [...msg: string]: any -> any {
  main -t fail ...$msg
}

# Dump a value at debug level
export def dump [...msg: string]: any -> any {
  main -t dump ...$msg
}
