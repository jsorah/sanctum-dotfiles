if exists('g:current_compiler')
  finish
endif
let g:current_compiler = 'tidy'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" 7.4.191 is the earliest version with the :S file name modifier, which we
" really should use if we can
if v:version >= 704 || v:version == 704 && has('patch191')
  CompilerSet makeprg=perlcritic\ --verbose\ 1\ %:S
else
  CompilerSet makeprg=perlcritic\ --verbose\ 1\ %
endif
CompilerSet errorformat=%f:%l:%c:%m
