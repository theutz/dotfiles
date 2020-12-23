" 
" Basic Settings
"
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
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

let mapleader = " "
let maplocalleader = ","

filetype indent on

"
" Plugins
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" Navigation
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'

" Version Control
Plug 'tpope/vim-fugitive'

" JS / TS / React
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

" Mappings

nnoremap <Leader>f :FZF<CR>
