jj util completion nushell
| save -f (
  $nu.data-dir
  | path join vendor autoload completions-jj.nu
)
