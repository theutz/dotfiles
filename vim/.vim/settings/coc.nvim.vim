"                                                 oo            
"                                                               
" .d8888b. .d8888b. .d8888b.    88d888b. dP   .dP dP 88d8b.d8b. 
" 88'  `"" 88'  `88 88'  `""    88'  `88 88   d8' 88 88'`88'`88 
" 88.  ... 88.  .88 88.  ... dP 88    88 88 .88'  88 88  88  88 
" `88888P' `88888P' `88888P' 88 dP    dP 8888P'   dP dP  dP  dP 
"                                                               
"                                                               

" Functions {{{

" Local {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"}}}

" Global {{{
function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"}}}
"}}}

" Commands{{{
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
"}}}

" Autocmd {{{
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

augroup json_config_files
  au!
  autocmd BufNewFile,BufRead .prettierrc,.eslintrc set filetype=json
augroup end
"}}}

" vim: fdm=marker fdl=0
