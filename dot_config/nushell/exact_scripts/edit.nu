module edit {
  def main [file: string] {
    ^chezmoi edit --watch ([$env.HOME $file] | str join "/")
  }
}
