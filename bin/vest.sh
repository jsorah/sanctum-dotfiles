# Run a test(1) command and print a string to stdout showing pass/fail
if [ "$#" -eq 0 ] ; then
    printf >&2 'vest: Need test(1) arguments\n'
    exit 2
fi
vex test "$@"
