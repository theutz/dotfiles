if &compatible | set nocompatible | endif

filetype plugin indent on

" Remove all autocmmands
autocmd!

"function! s:ToggleEditableHelp()
"  if (&filetype == 'text')
"    set filetype=help
"    set nomodifiable
"    set readonly
"  elseif (&filetype == 'help')
"    set filetype=text
"    set modifiable
"    set noreadonly
"  endif
"
"  return ''
"endfunction
"
"nnoremap <expr> <Plug>(toggle-editable-help) <SID>ToggleEditableHelp()
"
"augroup toggle_editable_help
"  au!
"  au FileType help nmap <buffer> <Leader>te <Plug>(toggle-editable-help)
"  au FileType text nmap <buffer> <Leader>te <Plug>(toggle-editable-help)
"augroup END
