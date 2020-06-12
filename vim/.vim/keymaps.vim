" dP     dP                                                         
" 88   .d8'                                                         
" 88aaa8P'  .d8888b. dP    dP 88d8b.d8b. .d8888b. 88d888b. .d8888b. 
" 88   `8b. 88ooood8 88    88 88'`88'`88 88'  `88 88'  `88 Y8ooooo. 
" 88     88 88.  ... 88.  .88 88  88  88 88.  .88 88.  .88       88 
" dP     dP `88888P' `8888P88 dP  dP  dP `88888P8 88Y888P' `88888P' 
"                         .88                     88                
"                     d8888P                      dP                

nmap <leader>w <c-w>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <leader>vpi :InstallPlugins<cr>
nnoremap <leader>vrs :ReloadVimConfig<cr>
nnoremap <silent> K :call ShowDocumentation()<cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" vim: fdm=marker fdl=0
