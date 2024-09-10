# {{/* vim: ft=sh.tmpl */}}

if command -v chezmoi >/dev/null; then
  chezmoi="chezmoi"
elif [ -x "$HOME/bin/chezmoi" ]; then
  chezmoi="$HOME/bin/chezmoi"
elif [ -x "/opt/homebrew/bin/chezmoi" ]; then
  chezmoi="/opt/homebrew/bin/chezmoi"
else
  echo "error: chezmoi command could not be found"
  exit 1
fi

printf "using chezmoi at %s\n" "$chezmoi"
