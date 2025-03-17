set -x COLORS

if test (dark-mode status) = on
    set COLORS \
        "#282828" \
        "#cc241d" \
        "#98971a" \
        "#d79921" \
        "#458588" \
        "#b16286" \
        "#689d6a" \
        "#a89984" \
        "#928374" \
        "#fb4934" \
        "#b8bb26" \
        "#fabd2f" \
        "#83a598" \
        "#d3869b" \
        "#8ec07c" \
        "#d5c4a1" \
        "#fbf1c7"
else
    set COLORS \
        "#fbf1c7" \
        "#cc241d" \
        "#98971a" \
        "#d79921" \
        "#458588" \
        "#b16286" \
        "#689d6a" \
        "#7c6f64" \
        "#928374" \
        "#9d0006" \
        "#79740e" \
        "#b57614" \
        "#076678" \
        "#8f3f71" \
        "#427b58" \
        "#3c3836"
end

for i in (seq 1 (count $COLORS))
    set COLORS[$i] (string replace "#" "0xFF" $COLORS[$i])
end

if test (dark-mode status) = on
    set -x BAR_COLOR (string replace "0xFF" "0xCC" $COLORS[1])
    set -x TEXT_COLOR $COLORS[16]
else
    set -x BAR_COLOR (string replace "0xFF" "0xCC" $COLORS[16])
    set -x TEXT_COLOR $COLORS[1]
end
