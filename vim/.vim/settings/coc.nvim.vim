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
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
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

" Keymaps{{{
" nmap <silent> <tab> <Plug>(coc-range-select)
" xmap <silent> <s-tab> <Plug>(coc-range-select-backword)
" xmap <silent> <tab> <Plug>(coc-range-select)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : <SID>check_back_space() ? "\<tab>" : coc#refresh()
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> <leader>A :<c-u>CocList diagnostics<cr>
nnoremap <silent> <leader>E :<c-u>CocList extensions<cr>
nnoremap <silent> <leader>J :<c-u>CocNext<cr>
nnoremap <silent> <leader>K :<c-u>CocPrev<cr>
nnoremap <silent> <leader>O :<c-u>CocList outline<cr>
nnoremap <silent> <leader>R :<c-u>CocListResume<cr>
nnoremap <silent> <leader>S :<c-u>CocList -I symbols<cr>
nnoremap <silent> <leader>X :<c-u>CocList commands<cr>
xmap <leader>a <Plug>(coc-codeaction-selected)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>F :Format<cr>
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
nmap <localleader>p :Prettier<cr>
"}}}

" vim: fdm=marker fdl=0
