# Initialize starship
use starship.nu [init, set-config-path, render]
job spawn { render }
init
set-config-path
hide starship.nu
