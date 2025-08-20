# Activate
source <(fzf --zsh)

# Settings
export FZF_DEFAULT_COMMAND='fd --type f'

export FZF_DEFAULT_OPTS="
--height 40%
--layout reverse
--border top
--bind 'ctrl-d:preview-half-page-down'
--bind 'ctrl-u:preview-half-page-up'
"

export FZF_CTRL_R_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:italic
--header 'Press CTRL-Y to copy command into clipboard'
"

export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'
"

export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target
--preview 'tree -C {}'
"
