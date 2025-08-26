# Keybindings
$env.config.keybindings ++= [
  {
    name: add_pager
    modifier: alt
    keycode: char_p
    mode: [emacs vi_insert vi_normal]
    event: {
      send: ExecuteHostCommand
      cmd: "
      commandline
      | if ($in | str length) == 0 {
        history | last | get command
      } else {
        $in
      }
      | str trim
      | $'($in) | ($env.PAGER)'
      | commandline edit $in
      "
    }
  }
  {
    name: add_sudo
    modifier: alt
    keycode: char_s
    mode: [emacs vi_insert vi_normal]
    event: {
      send: ExecuteHostCommand
      cmd: "
      commandline
      | if ($in | str length) == 0 {
        history | last | get command
      } else {
        $in
      }
      | str trim
      | $'sudo ($in)'
      | commandline edit $in
      "
    }
  }
  {
    name: add_help
    modifier: alt
    keycode: char_h
    mode: [emacs vi_insert vi_normal]
    event: {
      send: ExecuteHostCommand
      cmd: "
      commandline
      | if (($in | str length) == 0) {
        history | last | get command
      } else {
        $in
      }
      | str trim
      | $'($in) --help | ($env.PAGER)'
      | commandline edit $in
      "
    }
  }
]
