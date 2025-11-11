# Fancy logs for fancy boys

export-env {
  $env.LOG_LEVEL = 3
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
  let text = [$out ...$msg] | compact | str join (char space) | str trim
  let level = $env.LOG_LEVEL? | default 3 | into int

  match ($type) {
    error | err | failure | fail | fatal => {color: (ansi red), level: 1}
    warn | warning => {color: (ansi yellow), level: 2}
    info => {color: (ansi blue), level: 3}
    debug => {color: (ansi magenta), level: 4}
    dump => {color: (ansi magenta), level: 1}
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
  | str trim
  | print -e

  $input
}

# Log at error leve
# Level 1
export alias err = main -t error

# Log a warning
# Level 2
export alias warn = main -t warn

# Log at info level
# Level 3
export alias info = main -t info

# Write a message at debug level
# Level 4
export alias debug = main -t debug

# Export a message at trace level
# Level 5
export alias trace = main -t trace

# Log a failure at error level
# Level 1
export alias fail = main -t fail

# Dump a value at highest level
# Level 1
export alias dump = main -t dump

# Log a success message at highest level
# Level 1
export alias success = main -t success

