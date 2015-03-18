# Create a temporary directory and change into it, to stop me putting stray
# files into $HOME, and making the system do cleanup for me. Single optional
# argument is the string to use for naming the directory; defaults to "scr".
scr() {
    if (($# <= 1)) ; then
        pushd -- "$(mktemp -dt "${1:-scr}".XXXXX)"
    else
        printf 'bash: scr: too many arguments\n' >&2
        return 1
    fi
}

