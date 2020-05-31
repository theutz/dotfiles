" dP     dP                                                         
" 88   .d8'                                                         
" 88aaa8P'  .d8888b. dP    dP 88d8b.d8b. .d8888b. 88d888b. .d8888b. 
" 88   `8b. 88ooood8 88    88 88'`88'`88 88'  `88 88'  `88 Y8ooooo. 
" 88     88 88.  ... 88.  .88 88  88  88 88.  .88 88.  .88       88 
" dP     dP `88888P' `8888P88 dP  dP  dP `88888P8 88Y888P' `88888P' 
"                         .88                     88                
"                     d8888P                      dP                

let mapleader = "\<Space>"
let maplocalleader = ","

" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
" xmap <silent> <TAB> <Plug>(coc-range-select)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <C-w>m <C-o>:MaximizerToggle!<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

nmap <leader>F :Format<cr>
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>w <C-w>
nmap <silent> [z <Plug>(coc-diagnostic-prev)
nmap <silent> ]z <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <space><tab> <plug>(fzf-maps-n)
nmap <space>g :G<cr>

nnoremap <C-w>m :MaximizerToggle!<CR>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <leader>bd :Bdelete<CR>
nnoremap <leader>vpi :call <SID>install_plugins()<CR>
nnoremap <leader>vrs :call <SID>reload_vim_config()<cr>
nnoremap <silent> <space>A  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>E  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>J  :<C-u>CocNext<CR>
nnoremap <silent> <space>K  :<C-u>CocPrev<CR>
nnoremap <silent> <space>O  :<C-u>CocList outline<cr>
nnoremap <silent> <space>R  :<C-u>CocListResume<CR>
nnoremap <silent> <space>S  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>X  :<C-u>CocList commands<cr>
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <space>! :Filetypes<cr>
nnoremap <space>/ :Ag 
nnoremap <space>: :Commands<cr>
nnoremap <space>? :Helptags<cr>
nnoremap <space>C :Commits<cr>
nnoremap <space>F :GFiles<cr>
nnoremap <space>G :GFiles?<cr>
nnoremap <space>L :Lines<cr>
nnoremap <space>T :NERDTreeFind<cr>
nnoremap <space>W :Windows<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>c :BCommits<cr>
nnoremap <space>e :History<cr>
nnoremap <space>f :Files<cr>
nnoremap <space>l :BLines<cr>
nnoremap <space>m :Marks<cr>
nnoremap <space>q :History:<cr>
nnoremap <space>s :Snippets<cr>
nnoremap <space>t :NERDTreeToggle<cr>
nnoremap <space>u :MundoToggle<cr>

omap <space><tab> <plug>(fzf-maps-o)

vnoremap <C-w>m :MaximizerToggle!<CR>gv

xmap <leader>a <Plug>(coc-codeaction-selected)
xmap <leader>f <Plug>(coc-format-selected)
xmap <space><tab> <plug>(fzf-maps-x)

" vim: fdm=marker fdl=0
