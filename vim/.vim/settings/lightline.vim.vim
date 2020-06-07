" dP oo          dP         dP   dP oo                   
" 88             88         88   88                      
" 88 dP .d8888b. 88d888b. d8888P 88 dP 88d888b. .d8888b. 
" 88 88 88'  `88 88'  `88   88   88 88 88'  `88 88ooood8 
" 88 88 88.  .88 88    88   88   88 88 88    88 88.  ... 
" dP dP `8888P88 dP    dP   dP   dP dP dP    dP `88888P' 
"            .88                                         
"        d8888P                                          

let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'cocstatus', 'gitbranch', 'obsession' ],
      \     [ 'readonly', 'filename', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'fugitive#head',
      \   'obsession': 'ObsessionStatus'
      \ }
      \ }

" vim: fdm=marker fdl=0
