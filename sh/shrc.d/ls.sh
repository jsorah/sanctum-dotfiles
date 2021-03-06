# Our ~/.profile should already have made a directory with the supported
# options for us; if not, we won't be wrapping ls(1) with a function at all
[ -d "$HOME"/.cache/sh/opt/ls ] || return

# If the system has already aliased ls(1) for us, like Slackware or OpenBSD
# does, just get rid of it
unalias ls >/dev/null 2>&1

# Discard GNU ls(1) environment variables if the environment set them
unset -v LS_OPTIONS LS_COLORS

# Define function proper
ls() {

    # -F to show trailing indicators of the filetype
    # -q to replace control chars with '?'
    set -- -Fq "$@"

    # If output is to a terminal, add -x to format entries across, not down
    [ -t 1 ] && set -- -x "$@"

    # Add --block-size=K to always show the filesize in kibibytes
    [ -e "$HOME"/.cache/sh/opt/ls/block-size ] &&
        set -- --block-size=1024 "$@"

    # Add --color if the terminal has at least 8 colors
    [ -e "$HOME"/.cache/sh/opt/ls/color ] &&
    [ "$({ tput colors||tput Co||echo 0; } 2>/dev/null)" -ge 8 ] &&
        set -- --color=auto "$@"

    # Add --time-style='+%Y-%m-%d %H:%M:%S' to show the date in my preferred
    # (fixed) format
    [ -e "$HOME"/.cache/sh/opt/ls/time-style ] &&
        set -- --time-style='+%Y-%m-%d %H:%M:%S' "$@"

    # If the operating system is FreeBSD, there are some specific options we
    # can add that might mean different things to e.g. GNU ls(1)
    case $OS in
        FreeBSD)
            # -D: Timestamp format
            # -G: Use color
            set -- -D '%Y-%m-%d %H:%M:%S' -G "$@"
            ;;
    esac

    # Run ls(1) with the concluded arguments
    command ls "$@"
}
