"             oo                              
"                                             
"    dP   .dP dP 88d8b.d8b. 88d888b. .d8888b. 
"    88   d8' 88 88'`88'`88 88'  `88 88'  `"" 
" dP 88 .88'  88 88  88  88 88       88.  ... 
" 88 8888P'   dP dP  dP  dP dP       `88888P' 
"                                             
"                                             

let config_files = [
  \ "~/.vim/plugins.vim",
  \ "~/.vim/settings.vim",
  \ "~/.vim/functions.vim",
  \ "~/.vim/autocommands.vim",
  \ "~/.vim/keymaps.vim",
  \ ]

for config_file in config_files
  execute "source " . config_file
endfor

" vim: fdm=marker fdl=1
