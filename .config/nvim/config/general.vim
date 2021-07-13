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
set timeout
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
set autoread
set nowrap

filetype plugin indent on

let mapleader = "\<Space>"
let maplocalleader = ","
let g:netrw_localrmdir="rm -r"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme spaceduck
