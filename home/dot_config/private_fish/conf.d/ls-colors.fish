if test $(dark-mode status) = on
    set -g theme gruvbox-dark
else
    set -g theme gruvbox-light
end
set -gx LS_COLORS $(~/.local/share/mise/shims/vivid generate $theme)
set -e theme
