" Basic Settings {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set timeout " default, but necessary for vim-which-key
set timeoutlen=500
set incsearch
set hlsearch
set modeline
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set splitright
set splitbelow
set undofile
set undodir=~/.vim/undo

let mapleader = "\<Space>"
let maplocalleader = ","

filetype indent on
"zc}}}

" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-textobj-delimited'
Plug 'tpope/vim-eunuch'

" Navigation
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
if has("nvim")
  Plug 'rbgrouleff/bclose.vim'
endif
Plug 'christoomey/vim-tmux-navigator'

" Version Control
Plug 'tpope/vim-fugitive'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'
Plug 'freitass/todo.txt-vim'
Plug 'flazz/vim-colorschemes'

" User Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-obsession'
Plug 'liuchengxu/vim-which-key'
Plug 'edkolev/tmuxline.vim'
Plug 'sunaku/vim-shortcut'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'

call plug#end()

" CoC extensions
let g:coc_global_extensions = [
      \ 'coc-json', 
      \ 'coc-git', 
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-gist',
      \ 'coc-graphql',
      \ 'coc-html',
      \ 'coc-htmlhint',
      \ 'coc-html-css-support',
      \ 'coc-markdownlint',
      \ 'coc-sh',
      \ 'coc-stylelint',
      \ 'coc-sql',
      \ 'coc-svg',
      \ 'coc-swagger',
      \ 'coc-tailwindcss',
      \ 'coc-vimlsp'
      \ ]
"}}}

" Post-Plugin Settings {{{

" Color scheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme Atelier_SeasideLight

" Airline
let g:airline_theme = 'base16_atelier_seaside'

" Ranger
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

" GitGutter
let g:gitgutter_map_keys = 0

" CoC.nvim {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}
"}}}

" Functions {{{
function! s:ToggleNumberStyle()
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
"}}}

" Mappings {{{

" Search {{{
nnoremap <silent> <leader><leader> :Maps<CR>
nnoremap <silent> <Leader>ss :Rg<CR>
nnoremap <silent> <Leader>sl :BLines<CR>
nnoremap <silent> <Leader>sL :Lines<CR>
nnoremap <silent> <Leader>sf :Files<CR>
nnoremap <silent> <Leader>sF :GFiles<CR>
nnoremap <silent> <Leader>sC :Colors<CR>
nnoremap <silent> <Leader>sc :Commands<CR>
nnoremap <silent> <leader>sm :Marks<CR>
nnoremap <silent> <leader>ls :Buffers<CR>
"}}}

" File {{{
nnoremap <silent> <Leader>fr :RangerCurrentFile<CR>
nnoremap <silent> <Leader>fR :Ranger<CR>
nnoremap <silent> <Leader>fs :w<CR>
"}}}

" Buffers {{{
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>
nnoremap <silent> <Leader>bd :bd<CR>
" }}}

" Git {{{
nnoremap <silent> <Leader>gg :Gstatus<CR>
nnoremap <silent> <Leader>gsh :<Plug>GitGutterStageHunk<CR>
"}}}

" Vim {{{
nnoremap <silent> <Leader>qri :source $MYVIMRC <Bar> PlugInstall<CR>
nnoremap <silent> <Leader>qrr :source $MYVIMRC <Bar> echo $MYVIMRC . " reloaded!"<CR>
"}}}

" toggles {{{
nnoremap <silent> <Leader>tn :call <SID>ToggleNumberStyle()<CR>
nnoremap <silent> <Leader>t<Space> :nohlsearch<CR>
nnoremap <silent> <Leader>tu :UndotreeToggle<CR>
nnoremap <silent> <Leader>tf :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tF :NERDTreeFind<CR>
" }}}
"}}}

" Autocommands {{{

" Open help in a vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Open man pages in a vertical split
augroup man_pages
  autocmd BufEnter *.txt if &filetype == 'man' | wincmd L | endif
augroup END
"}}}

" vim: fdm=marker fdl=0

