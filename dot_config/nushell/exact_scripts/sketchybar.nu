export def "sketchybar tail" [] {
  brew services info sketchybar --json
  | from json
  | select log_path error_log_path
  | get 0
  | values
  | tail -f ...$in
}
