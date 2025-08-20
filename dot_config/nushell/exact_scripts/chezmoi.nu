# Setup chezmoi

alias chezomi = chezmoi
alias cm = chezmoi
alias cms = if (which chezmoi-stat | is-not-empty) { cm stat } else { cm status }
alias cmad = cm add
alias cmap = cm apply
alias cmca = cm cat
alias cmcc = cm cat-config
alias cmcd = cm cd
alias cmce = cm edit-config-template
alias cmch = cm chattr
alias cmde = cm destroy
alias cmdf = cm diff
alias cmed = cm edit
alias cmfo = cm forget
alias cmg = cm git
alias cmgs = cm git status
alias cmin = cm init
alias cmma = cm merge-all
alias cmme = cm merge
alias cmra = cm re-add
alias cmsp = cm source-path
alias cmst = cm status
alias cmtp = cm target-path
