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
  elif [ -f craft ]; then
    valet php craft $argv
  fi
}


function readme() {
  glow -p "$(brew --prefix $argv)/README.md"
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

function _navi_call() {
   local result="$(navi "$@" </dev/tty)"
   printf "%s" "$result"
}

function _navi_widget() {
   local -r input="${LBUFFER}"
   local -r last_command="$(echo "${input}" | navi fn widget::last_command)"
   local replacement="$last_command"

   if [ -z "$last_command" ]; then
      replacement="$(_navi_call --print)"
   elif [ "$LASTWIDGET" = "_navi_widget" ] && [ "$input" = "$previous_output" ]; then
      replacement="$(_navi_call --print --query "$last_command")"
   else
      replacement="$(_navi_call --print --best-match --query "$last_command")"
   fi

   if [ -n "$replacement" ]; then
      local -r find="${last_command}_NAVIEND"
      previous_output="${input}_NAVIEND"
      previous_output="${previous_output//$find/$replacement}"
   else
      previous_output="$input"
   fi

   zle kill-whole-line
   LBUFFER="${previous_output}"
   region_highlight=("P0 100 bold")
   zle redisplay
}

function catt {
  if [[ -d "$@" ]]; then
    if command -v lsd &>/dev/null; then
      lsd -la "$@"
    else
      ls -la "$@"
    fi
  elif [[ -f "$@" ]]; then
    if command -v bat &>/dev/null; then
      bat "$@"
    else
      "$(which cat)" "$@"
    fi
  fi
}

function take {
  mkdir -p "$@" && cd "$@"
}

function txa {
  sessions="$(tmux ls 2>/dev/null | cut -d ':' -f1)"
  if [[ $? -eq 0 ]]; then
    session="$(echo $sessions | gum filter)"
    tmux attach-session -t $session
  else
    session="$(tmuxp ls | gum filter)"
    tmuxp load $session
  fi
}
