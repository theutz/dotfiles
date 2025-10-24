# ╭─────────────────────────────╮
# │ Create Autoload Directories │
# ╰─────────────────────────────╯

mkdir ($nu.data-dir | path join vendor autoload)
mkdir ($nu.default-config-dir | path join autoload)

use tm.nu
use aerospace.nu
use lctl.nu
use rose-pine.nu
use brewctl.nu
