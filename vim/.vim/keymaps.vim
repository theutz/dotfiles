" dP     dP                                                         
" 88   .d8'                                                         
" 88aaa8P'  .d8888b. dP    dP 88d8b.d8b. .d8888b. 88d888b. .d8888b. 
" 88   `8b. 88ooood8 88    88 88'`88'`88 88'  `88 88'  `88 Y8ooooo. 
" 88     88 88.  ... 88.  .88 88  88  88 88.  .88 88.  .88       88 
" dP     dP `88888P' `8888P88 dP  dP  dP `88888P8 88Y888P' `88888P' 
"                         .88                     88                
"                     d8888P                      dP                

let g:mapleader = "\<Space>"
let g:maplocalleader = ","
let g:which_key_map = {}

" nmap <silent> <tab> <Plug>(coc-range-select)
" xmap <silent> <s-tab> <Plug>(coc-range-select-backword)
" xmap <silent> <tab> <Plug>(coc-range-select)
imap <c-x><c-f> <Plug>(fzf-complete-path)
imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
imap <c-x><c-k> <Plug>(fzf-complete-word)
imap <c-x><c-l> <Plug>(fzf-complete-line)
inoremap <c-w>m <c-o>:MaximizerToggle!<cr>
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : <SID>check_back_space() ? "\<tab>" : coc#refresh()
nmap <leader><tab> <Plug>(fzf-maps-n)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>F :Format<cr>
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>g :G<cr>
nmap <leader>gJ 9999<leader>gj
nmap <leader>gj <Plug>(signify-next-hunk)
nmap <leader>gK 9999<leader>gk
nmap <leader>gk <Plug>(signify-prev-hunk)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>w <c-w>
nmap <silent> [z <Plug>(coc-diagnostic-prev)
nmap <silent> ]z <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <c-w>m :MaximizerToggle!<cr>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<cr>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<cr>
nnoremap <leader>! :Filetypes<cr>
nnoremap <leader>/ :Ag 
nnoremap <leader>: :Commands<cr>
nnoremap <leader>? :Helptags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bd :Bdelete<cr>
nnoremap <leader>c :BCommits<cr>
nnoremap <leader>C :Commits<cr>
nnoremap <leader>e :History<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>G :GFiles?<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>q :History:<cr>
nnoremap <leader>s :Snippets<cr>
nnoremap <leader>T :NERDTreeFind<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>u :MundoToggle<cr>
nnoremap <leader>vpi :InstallPlugins<cr>
nnoremap <leader>vrs :ReloadVimConfig<cr>
nnoremap <leader>W :Windows<cr>
nnoremap <silent> <leader>A :<c-u>CocList diagnostics<cr>
nnoremap <silent> <leader>E :<c-u>CocList extensions<cr>
nnoremap <silent> <leader>J :<c-u>CocNext<cr>
nnoremap <silent> <leader>K :<c-u>CocPrev<cr>
nnoremap <silent> <leader>O :<c-u>CocList outline<cr>
nnoremap <silent> <leader>R :<c-u>CocListResume<cr>
nnoremap <silent> <leader>S :<c-u>CocList -I symbols<cr>
nnoremap <silent> <leader>X :<c-u>CocList commands<cr>
nnoremap <silent> K :call ShowDocumentation()<cr>
omap <leader><tab> <Plug>(fzf-maps-o)
vnoremap <c-w>m :MaximizerToggle!<cr>gv
xmap <leader><tab> <Plug>(fzf-maps-x)
xmap <leader>a <Plug>(coc-codeaction-selected)
xmap <leader>f <Plug>(coc-format-selected)

" vim: fdm=marker fdl=0
