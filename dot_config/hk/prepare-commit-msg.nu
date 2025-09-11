def main [
  file: path
  source: string = ""
] {
  match ($source) {
    "" => {
      git diff --cached
      | ^mods --role prepare-commit-msg --no-cache --quiet
      | str trim
      | str trim --char "`"
      | str trim
      | [$in (open $file)]
      | str join "\n"
      | save --force $file
    }
    _ => {
      print -e $"not generating commit message for source: ($source)"
      exit
    }
  }
}
