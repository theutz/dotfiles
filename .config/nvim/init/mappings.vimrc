" FZF
nnoremap <silent> <C-p> :GFiles<CR>

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Window
nmap <Leader>w <C-w>

" Search 
nnoremap <silent> <leader><leader> :Maps<CR>
nnoremap <silent> <Leader>ss :Rg<CR>
nnoremap <silent> <Leader>sl :BLines<CR>
nnoremap <silent> <Leader>sL :Lines<CR>
nnoremap <silent> <Leader>sf :GFiles<CR>
nnoremap <silent> <Leader>sF :Files<CR>
nnoremap <silent> <Leader>sC :Colors<CR>
nnoremap <silent> <Leader>sc :Commands<CR>
nnoremap <silent> <leader>sm :Marks<CR>
nnoremap <silent> <leader>ls :Buffers<CR>
nnoremap <silent> <leader>sb :Buffers<CR>
nnoremap <silent> <leader>sh :History<CR>
nnoremap <silent> <leader>sn :NV<CR>

" File 
nnoremap <silent> <Leader>fr :RangerCurrentFile<CR>
nnoremap <silent> <Leader>fR :Ranger<CR>
nnoremap <silent> <Leader>fs :w<CR>
nnoremap <Leader>fcd :lcd %:p:h <Bar> pwd<CR>

" Buffers 
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>
nnoremap <silent> <Leader>bd :bd<CR>
" 
" Git 
nnoremap <silent> <Leader>gg :Git<CR>
nnoremap <silent> <Leader>gsh :<Plug>GitGutterStageHunk<CR>

" Quit 
nnoremap <silent> <Leader>qp :so $MYVIMRC <Bar> PlugInstall<CR>
nnoremap <silent> <Leader>qr :source $MYVIMRC <Bar> echom $MYVIMRC . " reloaded!"<CR>

" Toggles 
nmap <silent> <Leader>tn <Plug>(toggle-number-style)
nnoremap <silent> <Leader>t<Space> :nohlsearch<CR>
nnoremap <silent> <Leader>tu :UndotreeToggle<CR>
nnoremap <silent> <Leader>tf :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tF :NERDTreeFind<CR>
nmap <silent> <Leader>tt <Plug>(coc-terminal-toggle)<CR>
nmap <silent> <Leader>tg :Goyo<CR>

" Markdown Clipboard Image
nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" Local Leader 
map <LocalLeader> <Plug>(easymotion-prefix)

