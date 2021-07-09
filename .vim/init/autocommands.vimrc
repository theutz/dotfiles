" Open help in a vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
  autocmd FileType help nnoremap <buffer> <CR> <C-]>
  autocmd FileType help nnoremap <buffer> <BS> <C-T>
  autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
  autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
  autocmd FileType help nnoremap <buffer> t /\|\zs\S\+\ze\|<CR>
  autocmd FileType help nnoremap <buffer> T ?\|\zs\S\+\ze\|<CR>
augroup END

" Open man pages in a vertical split
augroup man_pages
  autocmd!
  autocmd BufEnter *.txt if &filetype == 'man' | wincmd L | endif
augroup END

" Redraw screen on resize
augroup resizing
  autocmd!
  autocmd VimResized * exe "normal \<C-W>="
augroup END

" Use limelight with goyo
augroup goyo_and_limelight
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" Close some buffers with just `q`
augroup buffers_to_close_with_q
  autocmd!
  autocmd FileType fugitive nmap <buffer> q <C-w>q
  autocmd FileType help nmap <buffer> q <C-w>q
augroup END

" Fugitive autocommands
augroup my_fugitive
  au!
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

