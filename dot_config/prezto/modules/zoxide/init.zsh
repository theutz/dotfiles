# Activate
eval "$(zoxide init zsh)"

# Settings
export _ZO_FZF_OPTS="
--tmux top,30%
--preview 'eza --color=always --width \$FZF_PREVIEW_COLUMNS --only-files --sort name --icons --all {2}'
--bind 'ctrl-d:preview-half-page-down'
--bind 'ctrl-u:preview-half-page-up'
"

# Aliases
alias cd='z'
