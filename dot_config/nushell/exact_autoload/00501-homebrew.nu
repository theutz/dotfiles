export module brewctl {
  def _list [] {
    ^brew services "--json" | from json
  }

  def _commands [] {
    [list start stop restart run kill]
  }

  def _complete [context: string] {
    match ($context | split words | get 1) {
      list => []
      start | run => (_stopped)
      stop | restart | kill => (_started)
      info => (_all)
    }
  }

  def _stopped [] {
    _list | where status != started | get name
  }

  def _started [] {
    _list | where status == started | get name
  }

  def _all [] {
    _list | get name
  }

  # View brew service status
  export def main [
    --long (-l)
    cmd: string@"_commands" = "list"
    service?: string@"_complete"
  ] {
    ^brew services $cmd $service
  }
}
use brewctl
