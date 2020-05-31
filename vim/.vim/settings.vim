"                     dP     dP   oo                            
"                     88     88                                 
" .d8888b. .d8888b. d8888P d8888P dP 88d888b. .d8888b. .d8888b. 
" Y8ooooo. 88ooood8   88     88   88 88'  `88 88'  `88 Y8ooooo. 
"       88 88.  ...   88     88   88 88    88 88.  .88       88 
" `88888P' `88888P'   dP     dP   dP dP    dP `8888P88 `88888P' 
"                                                  .88          
"                                              d8888P           

let vimsettings = '~/.vim/settings'

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor

" vim: fdm=marker fdl=0
