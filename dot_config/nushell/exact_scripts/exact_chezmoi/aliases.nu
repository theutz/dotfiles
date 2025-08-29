use stat.nu

export def --wrapped "chezmoi fuzzy" [
  --query (-q): string
  ...args
] {
  let cmd = [fzf --multi]
  | if ($query | is-not-empty) {
    append [$"--query=($query)"]
  } else { }

  chezmoi managed ...$args
  | run-external ...$cmd | complete
  | if $in.exit_code > 0 {
    error make { msg: "fzf finished with non-zero exit code" }
  } else { $in.stdout }
  | lines
  | each { [$env.HOME $in] | path join }
  | chezmoi edit --init --watch ...$in

  exec nu
}

export def --wrapped "chezmoi status-apply" [...args] {
  use stat.nu
  stat ...$args | print -e
  chezmoi apply --init --interactive ...$args
}

export alias chezomi = chezmoi
export alias cm = ^chezmoi
export alias cmad = cm add
export alias cmap = chezmoi status-apply
export alias cmca = cm cat
export alias cmcc = cm cat-config
export alias cmcd = cm cd
export alias cmce = cm edit-config-template
export alias cmch = cm chattr
export alias cmde = cm destroy
export alias cmdf = cm diff
export alias cmea = cmed --apply
export alias cmed = cm edit --init
export alias cmet = cm execute-template
export alias cmew = cmed --watch
export alias cmfo = cm forget
export alias cmfz = chezmoi fuzzy
export alias cmg = cm git
export alias cmgs = cm git status
export alias cmin = cm init
export alias cmls = cm managed
export alias cmlsd = cmls --include dirs
export alias cmlsf = cmls --include files
export alias cmlst = cmls --tree
export alias cmma = cm merge-all
export alias cmme = cm merge
export alias cmra = cm re-add --interactive
export alias cms = stat
export alias cmsp = cm source-path
export alias cmst = cm status
export alias cmtp = cm target-path
