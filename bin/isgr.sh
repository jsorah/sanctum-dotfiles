# Return an exit status for whether the current directory appears to be in a
# Git working copy

# No output, at all, ever; this is intended for use in scripting
exec >/dev/null 2>&1

# Enter the given directory (default to current directory)
cd -- "${1:-.}" || exit

# If neither of these commands work, this isn't a Git repository
git symbolic-ref --quiet HEAD ||
git rev-parse --short HEAD
