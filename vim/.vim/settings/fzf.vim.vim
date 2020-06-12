" .8888b          .8888b             oo            
" 88   "          88   "                           
" 88aaa  d888888b 88aaa     dP   .dP dP 88d8b.d8b. 
" 88        .d8P' 88        88   d8' 88 88'`88'`88 
" 88      .Y8P    88     dP 88 .88'  88 88  88  88 
" dP     d888888P dP     88 8888P'   dP dP  dP  dP 

" Settings{{{
let g:fzf_action = {
      \ 'ctrl-t': 'tab-split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

let g:fzf_buffers_jump = 1
"}}}

" Keymaps {{{
" Completion
imap <c-x><c-f> <Plug>(fzf-complete-path)
imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
imap <c-x><c-k> <Plug>(fzf-complete-word)
imap <c-x><c-l> <Plug>(fzf-complete-line)
" Maps
nmap <leader><tab> <Plug>(fzf-maps-n)
omap <leader><tab> <Plug>(fzf-maps-o)
xmap <leader><tab> <Plug>(fzf-maps-x)
" Others
nnoremap <leader>/ :Ag 
nnoremap <leader>: :Commands<cr>
nnoremap <leader>? :Helptags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bd :Bdelete<cr>
nnoremap <leader>C :BCommits<cr>
nnoremap <leader>c :Commits<cr>
nnoremap <leader>e :History<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>F? :GFiles?<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>q :History:<cr>
nnoremap <leader>W :Windows<cr>
nnoremap <leader>s :Snippets<cr>
"}}}

" vim: fdm=marker fdl=0
