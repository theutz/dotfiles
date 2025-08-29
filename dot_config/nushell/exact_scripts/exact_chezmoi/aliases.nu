# A nu-friendly version of chezmoi status
export def --wrapped "chezmoi stat" [
  --json # Output as json
  ...args
]: nothing -> table {
  run-external chezmoi status ...$args
  | parse --regex r#'(?<was>[ ADMR])(?<will>[ ADMR]) (?<file>.*$)'#
  | insert status {
    get was will | str join
  }
  | select file status was will
  | upsert since_last_write {|row|
    match $row.was {
      " " => $"(ansi default_dimmed)No change"
      "A" => $"(ansi green_bold)Entry was created"
      "M" => $"(ansi yellow_bold)Entry was modified"
      "D" => $"(ansi red_bold)Entry was removed"
    }
    | $in + (ansi reset)
  }
  | upsert with_next_apply {|row|
    match $row.will {
      " " => $"(ansi default_dimmed)No change"
      "A" => $"(ansi green_bold)Entry will be created"
      "M" => $"(ansi yellow_bold)Entry will be modified"
      "D" => $"(ansi red_bold)Entry will be deleted"
      "R" => $"(ansi magenta_bold)Script will be run"
    }
    | $in + (ansi reset)
  }
  | each {|row|
    if ($row.will =~ R) {
      $row | update cells { [(ansi default_italic) $in (ansi reset_italic)] | str join }
    } else { $row }
  }
  | if ($json) {
    to json | ansi strip
  } else {
    if (is-terminal --stdout) { $in } else {
      $in | table --theme=none --index=false
    }
  }
}

# Use FZF to search for managed files
export def "chezmoi fuzzy" [
  --debug (-d) # Enable debug logging
  ...args: string
] {
  let cmd = [fzf --multi]
  | if ($args | is-not-empty) {
    append [$"--query=($args | str join ' ')"]
  } else { }
  | tee { if ($debug) { debug | print -e } }

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
  chezmoi stat ...$args | print -e
  chezmoi apply --init --interactive ...$args
}

export def "chezmoi auto-commit" [] {
  chezmoi git add -- -A | print -e
  chezmoi generate git-commit-message
  | chezmoi git commit -- -m $in
  | print -e
  chezmoi git pull | print -e
  chezmoi git push | print -e
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
export alias cmec = chezmoi encrypt
export alias cmed = chezmoi edit --init
export alias cmet = chezmoi execute-template
export alias cmew = chezmoi edit --init --watch
export alias cmfo = chezmoi forget
export alias cmfz = chezmoi fuzzy
export alias cmg = chezmoi git
export alias cmgac = chezmoi auto-commit
export alias cmgen = chezmoi generate
export alias cmgencm = chezmoi generate git-commit-message
export alias cmgfm = chezmoi git pull
export alias cmgp = chezmoi git push
export alias cmgs = chezmoi git status
export alias cmin = chezmoi init
export alias cmls = chezmoi managed
export alias cmlsd = chezmoi managed --include dirs
export alias cmlsf = chezmoi managed --include files
export alias cmlst = chezmoi managed --tree
export alias cmma = chezmoi merge-all
export alias cmme = chezmoi merge
export alias cmra = chezmoi re-add --interactive
export alias cms = chezmoi stat
export alias cmsp = chezmoi source-path
export alias cmst = chezmoi status
export alias cmtp = chezmoi target-path
export alias cmup = chezmoi update --init
export alias cmupa = chezmoi update --init --apply
