use xdg.nu

def groups [] {
  pueue status --json | from json | get tasks | values | get group
}

# Follow pueue logs
export def main [
  name: string@groups
] {
  pueue status -g $name --json | from json
    | get tasks | values
    | where status == Running | get -i id.0
    | if ($in | is-not-empty) {
        pueue log $in
        pueue follow $in
      } else {
        $"($name) is not active"
      }
}
