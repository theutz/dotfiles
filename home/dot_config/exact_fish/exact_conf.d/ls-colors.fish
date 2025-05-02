if test $(dark-mode status) = on
    set -g theme rose-pine
else
    set -g theme rose-pine-dawn
end
set -gx LS_COLORS $(~/.local/share/mise/shims/vivid generate $theme)
set -e theme
