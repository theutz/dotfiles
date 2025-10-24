job spawn {
  zoxide init nushell | save --force ($nu.data-dir | path join vendor autoload zoxide.nu)
}

alias ze = zoxide edit
