[ -f "$HOME"/.downloads ] || return
(
    while IFS= read -r dir ; do
        case $dir in
            '#'*) continue ;;
        esac
        [ -d "$dir" ] || continue
        set -- "$dir"/*
        [ -e "$1" ] || shift
        [ "$#" -gt 0 ] || continue
        printf 'You have %u unsorted files in %s.\n' "$#" "$dir"
    done < "$HOME"/.downloads
)
