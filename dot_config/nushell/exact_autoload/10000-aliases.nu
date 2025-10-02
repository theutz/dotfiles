def f [] {
  fzf --multi | complete | $in.stdout | lines
  | run-external ($env.VISUAL? | default $env.EDITOR? | default vim) ...$in
}

alias m = mise
alias mx = mise exec
alias mr = mise run

def l [] { ls --all | grid --icons --color}
alias ll = ls -l
alias la = ls -la

alias lg = lazygit
alias ld = lazydocker

# Open a file in a new window
def --wrapped nw [...args] {
  which neovide | is-not-empty | if ($in) {
    neovide --fork ...$args
  } else {
    which wezterm | is-not-empty | if ($in) {
      job spawn { wezterm -e ([nvim ...$args] | str join " ") }
    } else {
      error make { msg: "Not sure how to make a new window" }
    }
  }
}

# Zoxide to a folder, open FZF, then open neovim
def zf [
  dir: string # The dir to jump to
  file: string = "" # The first part of the query
] {
  z $dir

  glob * | each { path relative-to $env.PWD } | to text
  | fzf --multi --select-1
  | complete
  | tee { $in.stderr | print -e }
  | if ($in.exit_code == 0) {
    let files = $in.stdout | lines 
    ^nvim ...$files
  }
}
