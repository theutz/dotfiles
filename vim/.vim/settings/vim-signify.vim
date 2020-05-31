"          oo                              oo                   oo .8888b          
"                                                                  88   "          
" dP   .dP dP 88d8b.d8b.          .d8888b. dP .d8888b. 88d888b. dP 88aaa  dP    dP 
" 88   d8' 88 88'`88'`88 88888888 Y8ooooo. 88 88'  `88 88'  `88 88 88     88    88 
" 88 .88'  88 88  88  88                88 88 88.  .88 88    88 88 88     88.  .88 
" 8888P'   dP dP  dP  dP          `88888P' dP `8888P88 dP    dP dP dP     `8888P88 
"                                                  .88                         .88 
"                                              d8888P                      d8888P  

" Settings {{{
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1
"}}}

" Keymaps {{{
nmap <leader>gJ 9999<leader>gj
nmap <leader>gj <Plug>(signify-next-hunk)
nmap <leader>gK 9999<leader>gk
nmap <leader>gk <Plug>(signify-prev-hunk)
" }}}

" vim: fdm=marker fdl=0
