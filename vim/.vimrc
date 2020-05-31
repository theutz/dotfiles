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
  \ ]

for config_file in config_files
  execute "source " . config_file
endfor

" Functions {{{1

" reload_vim_config() {{{2
if (!exists("*s:reload_vim_config"))
  function! s:reload_vim_config()
    source $MYVIMRC
    redraw " to flush redraws
    echom "Vim Config Reloaded!"
  endfunction
endif

" install_plugins() {{{2
if (!exists("*s:install_plugins"))
  function! s:install_plugins()
    call <SID>reload_vim_config()
    PlugInstall --sync
  endfunction
endif

" Keymaps {{{1

" General {{{2
let mapleader = ","
nnoremap <leader>vrs :call <SID>reload_vim_config()<cr>
nnoremap <leader>vpi :call <SID>install_plugins()<CR>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Window Commands {{{2
nmap <leader>w <C-w>

" junegunn/fzf.vim {{{2
nnoremap <space>f :Files<cr>
nnoremap <space>F :GFiles<cr>
nnoremap <space>G :GFiles?<cr>
nnoremap <space>c :BCommits<cr>
nnoremap <space>C :Commits<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>/ :Ag 
nnoremap <space>m :Marks<cr>
nnoremap <space>s :Snippets<cr>
nnoremap <space>: :Commands<cr>
nnoremap <space>? :Helptags<cr>
nnoremap <space>l :BLines<cr>
nnoremap <space>L :Lines<cr>
nnoremap <space>W :Windows<cr>
nnoremap <space>! :Filetypes<cr>
nnoremap <space>e :History<cr>
nnoremap <space>q :History:<cr>
nmap <space><tab> <plug>(fzf-maps-n)
xmap <space><tab> <plug>(fzf-maps-x)
omap <space><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" scrooloose/nerdtree {{{2
nnoremap <space>t :NERDTreeToggle<cr>
nnoremap <space>T :NERDTreeFind<cr>

" simnalamburt/vim-mundo {{{2
nnoremap <space>u :MundoToggle<cr>

" neoclide/coc.nvim {{{2
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [z <Plug>(coc-diagnostic-prev)
nmap <silent> ]z <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>F :Format<cr>
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
nnoremap <silent> <space>A  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>E  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>X  :<C-u>CocList commands<cr>
nnoremap <silent> <space>O  :<C-u>CocList outline<cr>
nnoremap <silent> <space>S  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>J  :<C-u>CocNext<CR>
nnoremap <silent> <space>K  :<C-u>CocPrev<CR>
nnoremap <silent> <space>R  :<C-u>CocListResume<CR>

" szw/vim-maximizer {{{2
nnoremap <C-w>m :MaximizerToggle!<CR>
vnoremap <C-w>m :MaximizerToggle!<CR>gv
inoremap <C-w>m <C-o>:MaximizerToggle!<CR>

" moll/vim-bbye {{{2
nnoremap <leader>bd :Bdelete<CR>

" mhinz/vim-signify {{{2
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

" tpope/vim-fugitive {{{2
nmap <space>g :G<cr>

" Autocmd {{{1

" Resize {{{2
autocmd VimResized * wincmd =

" vim: fdm=marker fdl=1
