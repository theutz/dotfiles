# ┌───────┐
# │ Setup │
# └───────┘

mise activate nu | save --force ($nu.data-dir | path join vendor autoload mise.nu)
overlay use ($nu.data-dir | path join vendor autoload mise.nu) as mise-mod

# ┌─────────┐
# │ Aliases │
# └─────────┘

alias m = mise
alias mx = mise exec
alias mr = mise run
alias mt = mise tasks
alias mtx = mise tasks ls -x
