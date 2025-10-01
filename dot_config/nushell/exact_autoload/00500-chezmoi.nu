def --wrapped "chezmoi status" [...args] {
  if ($args | any {|| $in in [--help -h]}) {
    ^chezmoi status --help
    return
  }

  ^chezmoi status ...$args
  | complete
  | if ($in.exit_code > 0) {
    let label = { text: "Error originates here" span: (metadata $args).span }
    error make { msg: $in.stderr, label: $label  }
  } else { $in.stdout }
  | parse --regex r#'(?<was>.)(?<will>.) (?<file>.*)'#
  | insert status {|| [$in.was $in.will] | str join }
  | select file status was will
}

alias c = chezmoi
alias cma = chezmoi add
alias cmc = chemzoi chattr
alias cmd = chezmoi diff
alias cml = chezmoi managed
alias cmm = chezmoi merge
alias cmM = chezmoi merge-all
alias cmp = chezmoi apply
alias cmr = chezmoi re-add
alias cms = chezmoi status
alias cmX = chezmoi destroy
alias cmx = chezmoi forget
alias cmz = chezmoi cd
