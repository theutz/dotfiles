"  88888888b                              dP   oo                            
"  88                                     88                                 
" a88aaaa    dP    dP 88d888b. .d8888b. d8888P dP .d8888b. 88d888b. .d8888b. 
"  88        88    88 88'  `88 88'  `""   88   88 88'  `88 88'  `88 Y8ooooo. 
"  88        88.  .88 88    88 88.  ...   88   88 88.  .88 88    88       88 
"  dP        `88888P' dP    dP `88888P'   dP   dP `88888P' dP    dP `88888P' 
"                                                                            
"                                                                            

" ReloadVimConfig {{{
if (!exists("*s:reload_vim_config"))
  function! s:reload_vim_config()
    source $MYVIMRC
    redraw " to flush redraws
    echom "Vim Config Reloaded!"
  endfunction
endif

command! -nargs=0 ReloadVimConfig :call <SID>reload_vim_config()
"}}}

" InstallPlugins {{{
if (!exists("*s:install_plugins"))
  function! s:install_plugins()
    call <SID>reload_vim_config()
    PlugInstall --sync
  endfunction
endif

command! -nargs=0 InstallPlugins :call <SID>install_plugins()
"}}}

" vim: fdm=marker fdl=0
