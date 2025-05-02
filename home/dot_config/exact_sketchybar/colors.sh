palette="$("$HOME/bin/dracula" --json)"

function color() {
    alpha="ff"
    pos=()
    while [[ $# -gt 0 ]]; do
        case "$1" in
        --alpha | -a)
            alpha="$2"
            shift 2
            ;;
        *)
            pos=("$1")
            shift
            ;;
        esac
    done
    set -- "${pos[@]}"

    hex="$(
        jq -r --arg name "$1" \
            'with_entries(.key |= ascii_downcase) | .[$name | ascii_downcase]' \
            <<<"$palette"
    )"
    echo "0x$alpha${hex//#/}"
}
