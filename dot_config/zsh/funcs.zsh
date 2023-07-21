#
# Functions
#

function rgd() {
  rg --json "$argv" | delta
}

function a() {
  if [ -f please ]; then
    php please $argv
  elif [ -f artisan ]; then
    php artisan $argv
  elif [ -f vendor/bin/wp ]; then
    vendor/bin/wp $argv
  fi
}

function lg() {
  if [ "$TERM_PROGRAM" = tmux ]; then
    tmux display-popup -d "$PWD" -w 90% -h 80% -E lazygit
  else
    lazygit
  fi
}

function pope()
{
  if [[ -d $argv[1] ]]; then
    dir="$(dirname $argv[1])/$(basename $argv[1])"
    target="$dir"
  elif {[ -f $argv[1] ]}; then
    dir="$(dirname $argv[1])"
    target="$argv[1]"
  fi
  tmux display-popup -E -d $dir -h '90%' -w '70%' "nvim $target"
}

function commit() {
  commitMessage="$*"

  if [ "$commitMessage" = "" ]; then
    aicommits
    return
  fi

  eval "git commit -a -m '${commitMessage}'"
}

function pnpmg() {
  cd $HOME/npmbin
  yarn add $@
  cd -
}

function kagi() {
  local q=$(jq -R -r @uri <<<"$argv")
  local url="https://kagi.com/search?q=$q"
  echo "$url"
  open $url
}
