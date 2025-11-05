# ┌───────┐
# │ Setup │
# └───────┘

# This convoluted way of setting up mise is necessary until mise
# fixes the issue here: https://github.com/jdx/mise/discussions/6876#discussioncomment-14874967
which mise | first | get path
| run-external env '-i' $in activate nu
| save --force ($nu.data-dir | path join vendor autoload mise.nu)

overlay use ($nu.data-dir | path join vendor autoload mise.nu) as mise-mod

# ┌─────────┐
# │ Aliases │
# └─────────┘

alias m = mise
alias mx = mise exec
alias mr = mise run
alias mt = mise tasks
alias mtx = mise tasks ls -x

