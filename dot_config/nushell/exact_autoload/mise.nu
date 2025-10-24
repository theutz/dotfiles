# Keeps mise activation up-to-date, but requires a reload if there were a change.
mise activate nu | save --force ($nu.data-dir | path join vendor autoload mise.nu)

# Use the autoloaded module
use ($nu.data-dir | path join vendor autoload mise.nu)
