{{- .nushell.shebang }}

# bordersrc hash: {{ include (joinPath .chezmoi.homeDir ".config" "borders" "bordersrc") | sha256sum }}

brew services restart borders
