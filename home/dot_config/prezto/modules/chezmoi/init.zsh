alias cm='chezmoi'
alias cma='chezmoi add'
alias cmad='chezmoi-add-deleted'
alias cmap='chezmoi apply'
alias cmcat='chezmoi cat'
alias cmch='chezmoi chattr'
alias cmtmpl='chezmoi chattr template'
alias cmcd='chezmoi cd'
alias cmdata='chezmoi data'
alias cmd='chezmoi diff'
alias cme='chezmoi edit'
alias cmea='chezmoi edit --apply'
alias cmec='chezmoi edit-config-template'
alias cmew='chezmoi edit --apply --watch'
alias cmex='chezmoi execute-template'
alias cmf='chezmoi forget'
alias cmg='chezmoi git --'
alias cmgws='chezmoi git status'
alias cmi='chezmoi init'
alias cmlg='lazygit -p $(chezmoi execute-template "{{ .chezmoi.config.sourceDir }}")'
alias cmls='chezmoi managed'
alias cmlss='chezmoi managed -p source-relative'
alias cmlsi='chezmoi unmanaged'
alias cmm='chezmoi merge'
alias cmma='chezmoi merge-all'
alias cmra='chezmoi re-add'
alias cmrm='chezmoi destroy'
alias cms='chezmoi status-all'
alias cmsp='chezmoi source-path'
alias cmtp='chezmoi target-path'
alias cmup='chezmoi update'
