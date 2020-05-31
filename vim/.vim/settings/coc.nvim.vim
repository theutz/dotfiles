"                                                 oo            
"                                                               
" .d8888b. .d8888b. .d8888b.    88d888b. dP   .dP dP 88d8b.d8b. 
" 88'  `"" 88'  `88 88'  `""    88'  `88 88   d8' 88 88'`88'`88 
" 88.  ... 88.  .88 88.  ... dP 88    88 88 .88'  88 88  88  88 
" `88888P' `88888P' `88888P' 88 dP    dP 8888P'   dP dP  dP  dP 
"                                                               
"                                                               

"
" Functions
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"
" Commands
"
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" vim: fdm=marker fdl=0
