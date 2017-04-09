# Record a timestamped message to a logfile, defaulting to ~/.clog
self=clog
command -v rlwrap >/dev/null 2>&1 &&
    set -- rlwrap -C "$self" "$@"
{
    date
    "$@" cat -
    printf '%s\n' --
} >>"${CLOG:-"$HOME"/.clog}"