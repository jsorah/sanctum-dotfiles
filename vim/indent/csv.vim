" Only do this when not done yet for this buffer
if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

" Manual indenting and literal tabs for CSVs
setlocal noautoindent
setlocal noexpandtab
let b:undo_indent = 'setlocal autoindent< expandtab<'
