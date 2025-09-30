job spawn {
  mise activate nu | save --force ($nu.data-dir | path join vendor autoload mise.nu)
} | ignore

use ($nu.data-dir | path join vendor autoload mise.nu)
