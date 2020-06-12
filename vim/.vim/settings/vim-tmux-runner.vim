"          oo                       dP                                                                                               
"                                   88                                                                                               
" dP   .dP dP 88d8b.d8b.          d8888P 88d8b.d8b. dP    dP dP.  .dP          88d888b. dP    dP 88d888b. 88d888b. .d8888b. 88d888b. 
" 88   d8' 88 88'`88'`88 88888888   88   88'`88'`88 88    88  `8bd8'  88888888 88'  `88 88    88 88'  `88 88'  `88 88ooood8 88'  `88 
" 88 .88'  88 88  88  88            88   88  88  88 88.  .88  .d88b.           88       88.  .88 88    88 88    88 88.  ... 88       
" 8888P'   dP dP  dP  dP            dP   dP  dP  dP `88888P' dP'  `dP          dP       `88888P' dP    dP dP    dP `88888P' dP       
"                                                                                                                                    
"                                                                                                                                    

" Settings{{{
let g:VtrUseVtrMaps = 0
"}}}

" Keymaps{{{
nnoremap <leader>vsc :VtrSendCommandToRunner!<cr>
nnoremap <leader>vva  :VtrAttachToPane<cr>
nnoremap <leader>vror :VtrReorientRunner<cr>
nnoremap <leader>vsc  :VtrSendCommandToRunner<cr>
nnoremap <leader>vsf  :VtrSendFile<cr>
nnoremap <leader>vsl  :VtrSendLinesToRunner<cr>
nnoremap <leader>vor  :VtrOpenRunner<cr>
nnoremap <leader>vkr  :VtrKillRunner<cr>
nnoremap <leader>vfr  :VtrFocusRunner<cr>
nnoremap <leader>vdr  :VtrDetachRunner<cr>
nnoremap <leader>vcr  :VtrClearRunner<cr>
nnoremap <leader>vfc  :VtrFlushCommand<cr>
"}}}

" vim: fdm=marker fdl=0
