# Move back up the directory tree to the first directory matching the name
bd() {

    # For completeness' sake, we'll pass any options to cd
    local arg
    local -a opts
    for arg ; do
        case $arg in
            --)
                shift
                break
                ;;
            -*)
                shift
                opts[${#opts[@]}]=$arg
                ;;
            *)
                break
                ;;
        esac
    done

    # We should have zero or one arguments after all that, bail if there are
    # more
    if (($# > 1)) ; then
        printf 'bash: %s: usage: %s [PATH]\n' \
            "$FUNCNAME" "$FUNCNAME" >&2
        return 2
    fi

    # The requested pattern is the first argument; strip trailing slashes if
    # there are any
    local req=$1
    [[ $req != / ]] || req=${req%/}

    # What to do now depends on the request
    local dirname
    case $req in

        # If no argument at all, just go up one level
        '')
            dirname=..
            ;;

        # Just go straight to the root or dot directories if asked
        /|.|..)
            dirname=$req
            ;;

        # Anything else with a leading / needs to anchor to the start of the
        # path
        /*)
            dirname=$req
            if [[ $PWD != "$dirname"/* ]] ; then
                printf 'bash: %s: Directory name not in path\n' \
                    "$FUNCNAME" >&2
                return 1
            fi
            ;;

        # In all other cases, iterate through the directory tree to find a
        # match, or whittle the dirname down to an empty string trying
        *)
            dirname=${PWD%/*}
            while [[ -n $dirname && $dirname != */"$req" ]] ; do
                dirname=${dirname%/*}
            done
            if [[ -z $dirname ]] ; then
                printf 'bash: %s: Directory name not in path\n' \
                    "$FUNCNAME" >&2
                return 1
            fi
            ;;
    esac

    # Try to change into the determined directory
    builtin cd "${opts[@]}" -- "$dirname"
}
