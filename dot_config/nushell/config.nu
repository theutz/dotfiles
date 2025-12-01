# ╭─────────────────────────────╮
# │ Create Autoload Directories │
# ╰─────────────────────────────╯

mkdir ($nu.data-dir | path join vendor autoload)
mkdir ($nu.default-config-dir | path join autoload)

$env.config.rm.always_trash = true
$env.config.display_errors.exit_code = true
$env.config.highlight_resolved_externals = true
$env.config.render_right_prompt_on_last_line = true

use std/dirs
use std/dirs shells-aliases *
use std-rfc/kv *
use std-rfc/iter only
use tm.nu
use aerospace.nu
use lctl.nu
use rose-pine.nu
use brewctl.nu
use twilight.nu
use vpn.nu

[
  # Core
  inc
  formats
  query
  gstat
  # Third-party
  # dns
]
| each {|plugin|
  which $"nu_plugin_($plugin)"
  | get path.0
  | plugin add $in
} | ignore

