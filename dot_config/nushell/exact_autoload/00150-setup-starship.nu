# Keeps starship init up-to-date, but requires a reload if there were a change.
job spawn {
  starship init nu | save -f ($nu.data-dir | path join vendor autoload starship.nu)
} | ignore

# Starship config should already be autoloaded
