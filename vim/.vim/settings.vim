"                     dP     dP   oo                            
"                     88     88                                 
" .d8888b. .d8888b. d8888P d8888P dP 88d888b. .d8888b. .d8888b. 
" Y8ooooo. 88ooood8   88     88   88 88'  `88 88'  `88 Y8ooooo. 
"       88 88.  ...   88     88   88 88    88 88.  .88       88 
" `88888P' `88888P'   dP     dP   dP dP    dP `8888P88 `88888P' 
"                                                  .88          
"                                              d8888P           

" General Application {{{
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set autoread
set hidden
"}}}

" User Interface {{{
set laststatus=2
set ruler
set wildmenu
set tabpagemax=40
set cursorline
set nocursorcolumn
set number relativenumber " hybrid line numbers
set noerrorbells
set visualbell
set mouse=a
set title
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set splitright
set splitbelow
set colorcolumn=80,100
let g:mapleader = "\<Space>"
let g:maplocalleader = ","
"}}}

" Colors {{{
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme dracula
"}}}

" Swap & Backup Files {{{
set directory=$HOME/.vim/swp
set backupdir=~/.vim/.backup
set nobackup
set nowritebackup
"}}}

" Indentation {{{
set autoindent
filetype plugin indent on
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"}}}

" Search {{{
set incsearch
set nohlsearch
set showmatch
set ignorecase
set smartcase
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
"}}}

" Folding {{{
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
"}}}

" Text Rendering {{{
set encoding=utf-8
scriptencoding utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5
"}}}

" Miscellaneous {{{
set confirm
set modeline
set modelines=5
set nrformats-=octal
" set shell=/usr/bin/local/zsh
set nospell
set exrc
set nostartofline
set textwidth=80
"}}}

" Undo {{{
set undofile
set undodir=~/.vim/undodir
"}}}

" Plugin Settings {{{
let vimsettings = '~/.vim/settings'

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor
"}}}

" vim: fdm=marker fdl=0
