# Keeps mise activation up-to-date, but requires a reload if there were a change.
job spawn {
  mise activate nu | save --force ($nu.data-dir | path join vendor autoload mise.nu)
} | ignore

# Use the autoloaded module
use ($nu.data-dir | path join vendor autoload mise.nu)
