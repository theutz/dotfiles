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
  | parse --regex r#'(?<did>.)(?<will>.) (?<file>.*)'#
  | insert status {|| [$in.did $in.will] | str join }
  | select file status did will
  | update file {|row|
    if ($row.will == R) { return $row.file }
    | [$env.HOME $row.file] | path join
    | try {
      coreutils realpath --relative-to=. $in | complete
      | match ($in.exit_code) {
        0 => ($in.stdout | str trim)
        _ => $row.file
      }
    }
  }
}

# Add all files marked for deletion
def "chezmoi add-will-delete" [] {
  chezmoi status
  | where will == D
  | chezmoi add ...$in.file
}

# Forget files that were deleted
def "chezmoi forget-deleted" [] {
  chezmoi status
  | where did == D and will == A
  | chezmoi forget ...$in.file
}

def --wrapped "chezmoi apply" [...args] {
  chezmoi status
  ^chezmoi apply ...$args
}

alias cm = chezmoi
alias cma = chezmoi add
alias cmawd = chezmoi add-will-delete
alias cmc = chezmoi chattr
alias cmd = chezmoi diff
alias cml = chezmoi managed
alias cmm = chezmoi merge
alias cmM = chezmoi merge-all
alias cmp = chezmoi apply
alias cmr = chezmoi re-add
alias cms = chezmoi status --exclude scripts
alias cmS = chezmoi status
alias cmX = chezmoi destroy
alias cmx = chezmoi forget
alias cmxd = chezmoi forget-deleted
alias cmz = chezmoi cd
