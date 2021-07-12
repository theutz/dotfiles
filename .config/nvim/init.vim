"source $HOME/.vim/init/plug.vimrc " plugin loader
source $HOME/.config/nvim/init/general.vimrc " vim settings
source $HOME/.config/nvim/init/functions.vimrc " custom functions
source $HOME/.config/nvim/init/commands.vimrc " custom commands
source $HOME/.config/nvim/init/mappings.vimrc " custom mappings
source $HOME/.config/nvim/init/autocommands.vimrc " custom autocommands
source $HOME/.config/nvim/init/plugins.vimrc " plugin-specific settings

"function! s:ToggleEditableHelp()
"  if (&filetype == 'text')
"    set filetype=help
"    set nomodifiable
"    set readonly
"  elseif (&filetype == 'help')
"    set filetype=text
"    set modifiable
"    set noreadonly
"  endif
"
"  return ''
"endfunction
"
"nnoremap <expr> <Plug>(toggle-editable-help) <SID>ToggleEditableHelp()
"
"augroup toggle_editable_help
"  au!
"  au FileType help nmap <buffer> <Leader>te <Plug>(toggle-editable-help)
"  au FileType text nmap <buffer> <Leader>te <Plug>(toggle-editable-help)
"augroup END
