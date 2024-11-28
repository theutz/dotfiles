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
--color='bg:0,fg:7,hl:3'
--color='bg+:8,fg+:4,hl+:9'
--color='info:3,border:3,prompt:4'
--color='pointer:0,marker:9,spinner:9,header:1'
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
