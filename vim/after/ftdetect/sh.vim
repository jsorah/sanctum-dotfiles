" Names/paths of things that are Bash shell script
autocmd BufNewFile,BufRead
    \ **/.dotfiles/bash/**,bash-fc-*
    \ let g:is_bash = 1 |
    \ setlocal filetype=sh

" Names/paths of things that are Korn shell script
autocmd BufNewFile,BufRead
    \ **/.dotfiles/pdksh/**,.pdkshrc,*.pdksh
    \ let g:is_kornshell = 1 |
    \ setlocal filetype=sh

" Names/paths of things that are POSIX shell script
autocmd BufNewFile,BufRead
    \ **/.dotfiles/sh/**,.shinit,.shrc,.xinitrc,/etc/default/*
    \ let g:is_posix = 1 |
    \ setlocal filetype=sh
