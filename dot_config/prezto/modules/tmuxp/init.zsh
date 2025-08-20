current_script="${(%):-%x}"
current_dir="$(dirname "$current_script")"
path+=("$current_dir/bin")

alias txp='tmuxp'
alias txpls='tmuxp ls'
alias txa='tmuxp-attach'
alias txe='tmuxp-edit'
