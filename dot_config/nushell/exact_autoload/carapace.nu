$env.CARAPACE_BRIDGES = 'zsh,fish,bash'

const file = [$nu.data-dir vendor autoload carapace.nu] | path join

carapace -- carapace _carapace nushell | save --force $file
source $file
