$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional

const file = [$nu.data-dir vendor autoload carapace.nu] | path join

job spawn {
  carapace _carapace nushell
  | save --force $file
}

source $file
