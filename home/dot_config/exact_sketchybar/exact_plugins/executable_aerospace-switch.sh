#!/usr/bin/env zsh

typeset -A workspaces

{{ range $i, $v .workspaces }}
workspaces[{{ $v.name }}]=
{{ end }}
workspaces=(

)
workspace="$(echo "$NAME" | cut -d. -f2)"
aerospace workspace "$workspace"
