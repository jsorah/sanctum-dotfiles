# Move to the root directory of a VCS working copy
vr() {
    local path
    path=${1:-"$PWD"}
    path=${path%/}

    # Raise some helpful errors
    if [[ ! -e $path ]] ; then
        printf 'bash: %s: %s: No such file or directory\n' \
            "$FUNCNAME" "$path"
        return 1
    fi
    if [[ ! -d $path ]] ; then
        printf 'bash: %s: %s: Not a directory\n' \
            "$FUNCNAME" "$path"
        return 1
    fi
    if [[ ! -x $path ]] ; then
        printf 'bash: %s: %s: Permission denied\n' \
            "$FUNCNAME" "$path"
        return 1
    fi

    # Ask Git the top level
    local git_root
    git_root=$(cd -- "$path" && git rev-parse --show-toplevel 2>/dev/null)
    if [[ -n $git_root ]] ; then
        cd -- "$git_root"
        return
    fi

    # Ask Mercurial the top level
    local hg_root
    hg_root=$(cd -- "$path" && hg root 2>/dev/null)
    if [[ -n $hg_root ]] ; then
        cd -- "$hg_root"
        return
    fi

    # If we have a .svn directory, iterate upwards until we find an ancestor
    # that doesn't; hopefully that's the root
    if [[ -d $path/.svn ]] ; then
        local search
        search=$path
        while [[ -n $search ]] ; do
            if [[ -d ${search%/*}/.svn ]] ; then
                search=${search%/*}
            else
                cd -- "$search"
                return
            fi
        done
    fi

    # Couldn't find repository root, say so
    printf 'bash: %s: Failed to find repository root\n' \
        "$FUNCNAME" >&2
    return 1
}
complete -A directory vr
