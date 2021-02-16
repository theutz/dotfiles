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
set timeout " default, but necessary for vim-which-key
set timeoutlen=500
set incsearch
set hlsearch
set modeline
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

let mapleader = "\<Space>"
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
Plug 'freitass/todo.txt-vim'

" User Interface
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-obsession'
Plug 'liuchengxu/vim-which-key'

" Color Schemes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

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

" Which Key
let g:which_key_map = {}
call which_key#register('<Space>', 'g:which_key_map')
"}}}

" Functions
"{{{
function! s:ToggleNumberStyle()
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

" Setup Which Key{{{
nnoremap <silent> <Leader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :<C-u>WhichKeyVisual '<Space>'<CR>

" +files{{{
let g:which_key_map.f = { 'name': '+Files' }

nnoremap <Leader>ff :FZF<CR>
let g:which_key_map.f.f = 'FZF'

nnoremap <Leader>fn :NERDTreeToggle<CR>
let g:which_key_map.f.n = 'NERDTree'

nnoremap <Leader>fr :RangerCurrentFile<CR>
let g:which_key_map.f.r = 'Ranger (Current File)'
nnoremap <Leader>fR :Ranger<CR>
let g:which_key_map.f.R = 'Ranger (Current Working Directory)'
"}}}

" +git{{{
let g:which_key_map.g = { 'name': '+Git' }

nnoremap <Leader>gg :Gstatus<CR>
let g:which_key_map.g.g = 'Git Status'
"}}}

" +toggles {{{
let g:which_key_map.t = { 'name': '+Toggles' }

nnoremap <Leader>tn :call <SID>ToggleNumberStyle()<CR>
let g:which_key_map.t.n = 'Number Style'

nnoremap <Leader>t<Space> :nohlsearch<CR>
let g:which_key_map.t['<Space>'] = 'Search Highlight'

"}}}

" +quit {{{
let g:which_key_map.q = { 'name': '+Quit' }

" +reload {{{
let g:which_key_map.q.r = { 'name': '+Reload' }

nnoremap <silent> <Leader>qri :source $MYVIMRC <Bar> PlugInstall<CR>
let g:which_key_map.q.r.i = 'Install Plugins'

nnoremap <silent> <Leader>qrr :source $MYVIMRC <Bar> echo $MYVIMRC . " reloaded!"<CR>
let g:which_key_map.q.r.r = 'Reload Configuration'
"}}}
"}}}
"}}}

" Autocommands
"{{{

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

