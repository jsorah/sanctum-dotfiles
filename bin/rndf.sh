# Choose a random file from a given directory using rnda(1df); ignores dot
# files

# Directory is first argument; defaults to current directory
dir=${1:-.}

# Set the positional parameters to all the non-dotfiles in that directory
set -- "$dir"/*

# Check for an unexpanded glob (empty directory)
if ! [ -e "$1" ] ; then
    printf >&2 'rndf: No files found in %s\n' "$dir"
    exit 1
fi

# Print a random argument from the current positional parameters
rnda "$@"
