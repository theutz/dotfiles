if &compatible | set nocompatible | endif

filetype plugin indent on

" Remove all autocmmands
autocmd!

runtime! config/plug.vim " minpac setup
runtime! config/general.vim " vim settings
runtime! config/functions.vim " custom functions
runtime! config/commands.vim " custom commands
runtime! config/mappings.vim " custom mappings
runtime! config/autocommands.vim " custom autocommands
runtime! config/plugins.vim " plugin-specific settings

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
