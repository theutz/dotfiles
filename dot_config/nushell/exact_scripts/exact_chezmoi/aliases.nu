use stat.nu

export alias chezomi = chezmoi
export alias cm = ^chezmoi
export alias cmS = stat -g
export alias cmad = cm add
export alias cmap = cm apply --interactive .
export alias cmaP = cm apply --interactive
export alias cmcD = cm cd
export alias cmca = cm cat
export alias cmcc = chezmoi-cat-config
export alias cmcd = cm cd .
export alias cmce = cm edit-config-template
export alias cmch = cm chattr
export alias cmdF = cm diff
export alias cmde = cm destroy
export alias cmdf = cm diff .
export alias cmea = cm edit --apply
export alias cmet = cm execute-template
export alias cmew = cm edit --watch
export alias cmfo = cm forget
export alias cmg = cm git
export alias cmgs = cm git status
export alias cmin = cm init
export alias cmlS = cm managed
export alias cmlSd = cmls --include dirs
export alias cmlSf = cmls --include files
export alias cmlSt = cmls --tree
export alias cmls = cm managed .
export alias cmlsd = cmls --include dirs
export alias cmlsf = cmls --include files
export alias cmlst = cmls --tree
export alias cmmA = cm merge-all
export alias cmma = cm merge-all .
export alias cmme = cm merge
export alias cmrA = cm re-add --interactive
export alias cmra = cm re-add --interactive .
export alias cms = stat
export alias cmsp = cm source-path
export alias cmst = cm status
export alias cmtp = cm target-path

export def --wrapped chezmoi-cat-config [...args] {
  chezmoi cat-config ...$args | from toml | explore
}
