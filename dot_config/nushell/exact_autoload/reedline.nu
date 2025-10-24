$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.use_kitty_protocol = true
$env.config.render_right_prompt_on_last_line = false

use std/config [light-theme dark-theme]
$env.config.color_config = match ($env.APPEARANCE) {
  light => (light-theme)
  _ => (dark-theme)
}

$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi green_dimmed)(ansi reset) "
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi magenta)󰗧(ansi reset) "
$env.PROMPT_MULTILINE_INDICATOR = $"(ansi cyan):::::(ansi reset) "

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
  {
    name: complete_history
    modifier: control
    keycode: char_f
    mode: [vi_insert]
    event: {
      until: [
        { send: HistoryHintComplete }
        { send: menuright }
        { send: right }
      ]
    }
  }
  {
    name: complete_history
    modifier: shift
    keycode: char_l
    mode: [vi_normal]
    event: {
      until: [
        { send: HistoryHintComplete }
        { send: menuright }
        { send: right }
      ]
    }
  }
  {
    name: complete_history_word
    modifier: alt
    keycode: char_f
    mode: [vi_insert]
    event: {
      until: [
        { send: HistoryHintWordComplete }
        { edit: movewordright, value: {select: false}}
      ]
    }
  }
  {
    name: complete_history_word
    modifier: shift
    keycode: char_j
    mode: [vi_normal]
    event: {
      until: [
        { send: HistoryHintWordComplete }
        { edit: movewordright, value: {select: false}}
      ]
    }
  }
  {
    name: complete_history_word
    modifier: shift
    keycode: char_k
    mode: [vi_normal]
    event: { edit: cutwordleft  }
  }
]
