" If we can, add j to the format options to get rid of comment leaders when
" joining lines
if v:version > 703 || v:version ==# 703 && has('patch541')
  set formatoptions+=j
endif

"
" Quick way to toggle flags in 'formatoptions' that I often want to change;
" specifically:
"
" a - Automatically format paragraphs, reapplying the wrap on every text
"     insertion or deletion; sometimes I want this and sometimes I
"     don't, it particularly varies when typing prose in Markdown that
"     includes headings and code
" c - Automatically wrap comments at 'textwidth' (which I allow the filetypes
"     to set for me)
" t - Automatically wrap text at 'textwidth' (as above)
"
" So I just have to type e.g. \a to toggle the auto-format flag on and off;
" very handy
"
if has('eval')

  " Declare function
  function! s:ToggleFormatFlag(flag)

    " Decide on whether we're adding or removing the flag
    if &l:formatoptions =~# a:flag
      let l:command = 'setlocal formatoptions-=' . a:flag
    else
      let l:command = 'setlocal formatoptions+=' . a:flag
    endif

    " Execute the command we determined and show the result
    silent! execute l:command
    setlocal formatoptions?

  endfunction

  " Map leader-letters to corresponding format option flags
  nnoremap <silent> <leader>a :<C-U>call <SID>ToggleFormatFlag('a')<CR>
  nnoremap <silent> <leader>c :<C-U>call <SID>ToggleFormatFlag('c')<CR>
  nnoremap <silent> <leader>t :<C-U>call <SID>ToggleFormatFlag('t')<CR>

endif