# Find all the Git repositories in a directory and scrub them all

# Check we have gscr(1df) first
command -v gscr >/dev/null 2>&1 || exit

# Look for any dir named .git in the given (default current) dir and run
# gscr(1df) on it
find "${@:-.}" -name '*.git' -type d -exec gscr {} \;
