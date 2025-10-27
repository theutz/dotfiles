# ╭─────────────────────────────╮
# │ Create Autoload Directories │
# ╰─────────────────────────────╯

mkdir ($nu.data-dir | path join vendor autoload)
mkdir ($nu.default-config-dir | path join autoload)

use std/dirs
use std/dirs shells-aliases *
use tm.nu
use aerospace.nu
use lctl.nu
use rose-pine.nu
use brewctl.nu

[
  # Core
  inc
  formats
  query
  gstat
  # Third-party
  dns
]
| each {|plugin|
  which $"nu_plugin_($plugin)"
  | get path.0
  | plugin add $in
} | ignore
