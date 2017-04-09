# Prevent Vim's ex(1) implementation from clearing the screen
if [ -t 0 ] ; then
    ver=$(ex --version 2>/dev/null | awk 'NR==1{print $1;exit}')
    case $ver in
        # Lie to Vim; tell it it's a dumb terminal, and that its required "cm"
        # feature is invoked with a carriage return.
        VIM)
            cmd=$(printf 'set t_cm=\r|')
            set -- -T dumb --cmd "${cmd%|}" "$@" ;;
    esac
fi
exec ex "$@"