# Convert lowercase letters in a stream to uppercase
cat "${@:--}" |
tr '[:lower:]' '[:upper:]'
