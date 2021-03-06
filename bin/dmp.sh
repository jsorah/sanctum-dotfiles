# Pick a pass(1) password with dmenu(1)

# Get the password store directory, bail if we can't
pwsd=${PASSWORD_STORE_DIR:-"$HOME"/.password-store}
pwsd=${pwsd%/}
[ -n "$pwsd" ] || exit

# Get the password; get all the names from find(1)
# shellcheck disable=SC2016
pw=$(
    cd -- "$pwsd" || exit
    # Get all the names from find(1)
    find ./ -name \*.gpg |
    # Sort them
    sort |
    # Strip the leading directory and the trailing .gpg
    sed 's_^\./__;s_\.gpg$__' |
    # Use dmenu(1) to prompt the user to select one
    dmenu
) || exit

# Bail if we don't have a password
[ -n "$pw" ] || exit

# Pump the first line of the password into the clipboard
pass show "$pw" | sed 1q | xsel -ib || exit

# If we have notify-send(1), alert that the password has been copied
if command -v notify-send >/dev/null >&2 ; then
    notify-send "$(printf '%s in clipboard' "$pw")"
fi
