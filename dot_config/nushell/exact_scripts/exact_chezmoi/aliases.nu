use stat.nu

export def "chezmoi fuzzy" [
  ...args: string
] {
  let cmd = [fzf --multi]
  | if ($args | is-not-empty) {
    append [$"--query=($args | str join `'`)"]
  } else { }

  chezmoi managed
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
export alias cmad = chezmoi add
export alias cmap = chezmoi status-apply
export alias cmca = chezmoi cat
export alias cmcc = chezmoi cat-config
export alias cmcd = chezmoi cd
export alias cmce = chezmoi edit-config-template
export alias cmch = chezmoi chattr
export alias cmdc = chezmoi decrypt
export alias cmde = chezmoi destroy
export alias cmdf = chezmoi diff
export alias cmea = chezmoi edit --init --apply
export alias cmec = chezomi encrypt
export alias cmed = chezmoi edit --init
export alias cmet = chezmoi execute-template
export alias cmew = chezmoi edit --init --watch
export alias cmfo = chezmoi forget
export alias cmfz = chezmoi fuzzy
export alias cmg = chezmoi git
export alias cmgs = chezmoi git status
export alias cmin = chezmoi init
export alias cmls = chezmoi managed
export alias cmlsd = chezmoi managed --include dirs
export alias cmlsf = chezmoi managed --include files
export alias cmlst = chezmoi managed --tree
export alias cmma = chezmoi merge-all
export alias cmme = chezmoi merge
export alias cmra = chezmoi re-add --interactive
export alias cms = stat
export alias cmsp = chezmoi source-path
export alias cmst = chezmoi status
export alias cmtp = chezmoi target-path
