" Preserve the flags for a pattern when repeating a substitution with &; I
" don't really understand why this isn't a default, but there it is
nnoremap <silent>
      \ &
      \ :<C-U>&&<CR>

" Same again for visual mode; we use vnoremap rather than xnoremap to stay
" compatible with old Vims without doing :execute dances
vnoremap <silent>
      \ &
      \ :<C-U>&&<CR>
