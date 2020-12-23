" Basic Settings
"{{{
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
set incsearch
set hlsearch
set modeline
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

let mapleader = " "
let maplocalleader = ","

filetype indent on
"}}}

" Plugins
"{{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Navigation
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
if has("nvim")
  Plug 'rbgrouleff/bclose.vim'
endif

" Version Control
Plug 'tpope/vim-fugitive'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" User Interface
Plug 'vim-airline/vim-airline'

" Color Schemes
Plug 'pineapplegiant/spaceduck'

call plug#end()
"}}}

" Post-Plugin Settings
"{{{

" Color scheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme spaceduck

" Airline
let g:airline_theme = 'spaceduck'

" Ranger
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
"}}}

" Functions
"{{{
function! ToggleNumberStyle()
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
"}}}

" Mappings
"{{{
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>r :RangerCurrentFile<CR>
nnoremap <Leader>R :Ranger<CR>
nnoremap <LocalLeader><Space> :nohlsearch<CR>
"}}}

" vim: fdm=marker fdl=0

