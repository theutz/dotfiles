
export def "chezmoi stat" [] {
  use ./stat.nu
  stat
}

# ╭─────────╮
# │ Aliases │
# ╰─────────╯

# Mis-spellings
export alias chezomi = chezmoi

# Shortcuts
export alias cm = chezmoi
export alias cms = if (which chezmoi-stat | is-not-empty) { cm stat } else { cm status }
export alias cmad = cm add
export alias cmap = cm apply
export alias cmca = cm cat
export alias cmcc = cm cat-config
export alias cmcd = cm cd
export alias cmce = cm edit-config-template
export alias cmch = cm chattr
export alias cmde = cm destroy
export alias cmdf = cm diff
export alias cmed = cm edit
export alias cmfo = cm forget
export alias cmg = cm git
export alias cmgs = cm git status
export alias cmin = cm init
export alias cmma = cm merge-all
export alias cmme = cm merge
export alias cmra = cm re-add
export alias cmsp = cm source-path
export alias cmst = cm status
export alias cmtp = cm target-path

# ╭───────────╮
# │ Externals │
# ╰───────────╯

# Manage your dotfiles across multiple diverse machines, securely
export extern main []

#  Print the status of the files and scripts managed by chezmoi in a format
#  similar to git status.
#
#  The first column of output indicates the difference between the last state
#  written by chezmoi and the actual state. The second column indicates the
#  difference between the actual state and the target state, and what effect
#  running chezmoi apply will have.
#
#   Character    | Meaning     | First column       | Second column
#  --------------|-------------|--------------------|------------------------
#   Space        | No change   | No change          | No change
#   A            | Added       | Entry was created  | Entry will be created
#   D            | Deleted     | Entry was deleted  | Entry will be deleted
#   M            | Modified    | Entry was modified | Entry will be modified
#   R            | Run         | Not applicable     | Script will be run
export extern "chezmoi status" []
