" Only do this when not done yet for this buffer
" Also do nothing if 'compatible' enabled
if exists('b:did_ftplugin_sh_bash_han') || &compatible
  finish
endif
let b:did_ftplugin_sh_bash_han = 1
let b:undo_ftplugin = b:undo_ftplugin
      \ . '|unlet b:did_ftplugin_sh_bash_han'

" Use han(1df) as a man(1) wrapper for Bash files if available
if exists('b:is_bash') && executable('han')
  setlocal keywordprg=han
  let b:undo_ftplugin = b:undo_ftplugin
        \ . '|setlocal keywordprg<'
endif
