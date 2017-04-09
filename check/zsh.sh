for zsh in zsh/* zsh/zshrc.d/* ; do
    [ -f "$zsh" ] || continue
    zsh -n "$zsh" || exit
done
printf 'All zsh(1) scripts parsed successfully.\n'