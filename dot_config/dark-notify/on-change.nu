use service.nu
use xdg.nu

let scheme = ^dark-notify -e | complete | get stdout | str trim

service restart sketchybar
tmux source-file ~/.config/tmux/tmux.conf

let lgconfig = (xdg config lazygit config.yml)
open $lgconfig
  | upsert git.paging.pager $"delta --($scheme) --paging=never"
  | to yaml
  | save -f $lgconfig
