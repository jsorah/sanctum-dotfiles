# If given two arguments to cd, replace the first with the second in $PWD,
# emulating a Zsh function that I often find useful; preserves options too
__cd() {
    local -a opts
    while getopts elP opt; do
        opts[${#opts[@]}]="-$opt"
    done
    shift $(($OPTIND-1))
    if [[ $# -eq 2 ]]; then
        if [[ "$PWD" == *"$1"* ]]; then
            builtin cd "${opts[@]}" "${PWD/$1/$2}"
        else
            printf 'bash: cd: could not replace substring\n'
            return 1
        fi
    else
        builtin cd "${opts[@]}" "$@"
    fi
}
alias cd='__cd'

