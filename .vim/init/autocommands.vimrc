augroup help_pages_stuff
  autocmd!
  autocmd BufEnter *.txt if (&buftype == 'help' || &filetype == 'man') | wincmd L | endif
  autocmd FileType help nmap <buffer> q <C-w>q
augroup END

" Redraw screen on resize
augroup resize_on_redraw
  autocmd!
  autocmd VimResized * exe "normal \<C-W>="
augroup END

" Use limelight with goyo
augroup goyo_and_limelight
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" Fugitive autocommands
augroup fugitive_buffer_maps
  au!
  autocmd FileType fugitive nmap <buffer> q <C-w>q
  autocmd FileType fugitive nmap <buffer> Pu :Git push<CR>
  autocmd FileType fugitive nmap <buffer> Fu :Git pull<CR>
augroup END

" Reload vimrc automatically
augroup reload_my_vimrc
  au!
  au BufWritePost *.vimrc mkview
        \ | so $MYVIMRC
        \ | edit %
        \ | loadview
        \ | echo expand('%') . ' reloaded!'
augroup END

" Reload tmux after .tmux.conf write
augroup tmux_reload
  au!
  au BufWritePost .tmux.conf !tmux source-file ~/.tmux.conf\; display-message '~/.tmux.conf reloaded\!'
augroup END

