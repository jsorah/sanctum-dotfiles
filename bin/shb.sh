# Use PATH to build a shebang for a script given on stdin
self=shb

# Need at least one argument
if [ "$#" -lt 1 ] ; then
    printf >&2 '%s: Need interpreter command\n' "$self"
    exit 2
fi

# First argument is the name of the interpreter
intn=$1
shift

# Try and find the path to the interpreter command, bail out if we can't
if ! intp=$(command -v "$intn" 2>/dev/null) ; then
    printf >&2 '%s: %s: command not found\n' "$self" "$intn"
    exit 1
fi

# Set the positional parameters to the path and any remaining arguments, and
# squash them together for the shebang line
set -- "$intp" "$@"
printf '#!%s\n' "$*"

# Emit the rest of the input
cat -
