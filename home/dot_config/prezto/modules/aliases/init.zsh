# Global

alias -g P='| ${(z)PAGER}'
alias -g HP='--help 2>&1 | ${(z)PAGER}'

# Other
alias lg='lazygit'
alias ls='eza --group --group-directories-first --icons'
alias reload='exec zsh'
alias rl='exec zsh'
alias aliases="\${(z)EDITOR} ${0:a}"

# Wezterm
alias wez='wezterm cli'
alias ssw='wezterm ssh'
