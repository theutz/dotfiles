# Get output as table
export def status --wrapped [...args] {
  $args | filter {|x| $x != "--json" and $x != "-j"}
    | if "-h" in $in or "--help" in $in {
        ^pueue status --help
      } else {
        ^pueue status ...$in --json
          | from json
          | transpose name details
          | each { upsert details { transpose name details } }
          | reduce --fold {} {|it, acc| $acc | upsert $it.name $it.details }
      }
}
