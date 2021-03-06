# Attach to existing tmux session rather than create a new one if possible

# If given any arguments, just use them as they are
if [ "$#" -gt 0 ] ; then
    :

# If a session exists, just attach to it
elif tmux has-session 2>/dev/null ; then
    set -- attach-session -d

# Create a new session with an appropriate name
else
    set -- new-session -s "${TMUX_SESSION:-default}"
fi

# Execute with concluded arguments
tmux "$@"
