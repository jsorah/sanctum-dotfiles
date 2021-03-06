# Add an email-style quote header to input
self=wro

# Check arguments
if [ "$#" -gt 2 ] ; then
    printf >&2 '%s: Too many arguments\n' "$self"
    exit 2
fi

# Check first argument for the person to quote; if blank, try to form a
# reasonable-looking name from the system
if [ -n "$1" ] ; then
    from=$1
else
    un=$(id -nu)
    if [ -f /etc/mailname ] ; then
        read -r hn < /etc/mailname
    else
        hn=$(uname -n)
    fi
    from="$un"@"$hn"
fi

# Check second argument for the date; if blank, get the system date in whatever
# format it cares to give us
date=${2:-"$(date)"}

# Print the header and then the input
printf 'On %s, %s wrote:\n' "$date" "$from"
cat
