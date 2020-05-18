" VimPlug Init {{{1

"{{{2
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin List {{{1

"{{{2
call plug#begin('~/.vim/plugged')

" Appearance {{{2
Plug 'itchyny/lightline.vim' " status bar
Plug 'kshenoy/vim-signature' " show marks in gutter
Plug 'luochen1990/rainbow' " rainbow parentheses
Plug 'miyakogi/conoline.vim' " set cursor line highlight only in current window

" Color Schemes {{{2
Plug 'jacoborus/tender.vim'
Plug 'haishanh/night-owl.vim'
Plug 'dracula/Vim', {'as': 'dracula'}
Plug 'ayu-theme/ayu-vim'
Plug 'sainnhe/lightline_foobar.vim'

" Session {{{2
Plug 'tpope/vim-obsession' " track sessions better

" Completion {{{2
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language server support
Plug 'sirver/UltiSnips' " snippets

" Languages {{{2
Plug 'scrooloose/nerdcommenter' " commenting
Plug 'sheerun/vim-polyglot' " big language pack
Plug 'mattn/emmet-vim' " emmet (zen coding) support
Plug 'jparise/vim-graphql' " graphql language support
Plug 'jxnblk/vim-mdx-js' " mdx language support
Plug 'inkarkat/vim-SyntaxRange' " allow syntax definitions as a subset of a filetype
Plug 'alampros/vim-styled-jsx' " styled-jsx for nextjs

" Editing {{{2
Plug 'tpope/vim-abolish' " smart substitution
Plug 'tpope/vim-surround' " change surrounding text
Plug 'simnalamburt/vim-mundo' " undo history
Plug 'tpope/vim-repeat' " make more commands repeatable with .
Plug 'tpope/vim-speeddating' " auto-incrementable dates
Plug 'chrisbra/unicode.vim' " complete support for unicode digraphs
Plug 'wellle/targets.vim' " Add more text objects
Plug 'mattn/gist-vim' " edit GitHub gists with vim
Plug 'kburdett/vim-nuuid' " Work with uuids in vim

" Version Control "{{{2
Plug 'tpope/vim-fugitive' " git interface
Plug 'mhinz/vim-signify' " show git changes in gutter
Plug 'Xuyuanp/nerdtree-git-plugin' " show git changes in NERDTree
Plug 'airblade/vim-rooter' " change project directory to VCS root

" Navigation {{{2
Plug 'tpope/vim-unimpaired' " pairs of keyboard shortcuts
Plug 'junegunn/fzf', { 'do': { ->fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder vim integration
Plug 'scrooloose/nerdtree' " file tree
Plug 'tmux-plugins/vim-tmux-focus-events' " capture mouse events from tmux
Plug 'moll/vim-bbye' " adds :Bdelete and :Bwipeout
Plug 'szw/vim-maximizer' " Easy window maximization

" Integrations {{{2
Plug 'rizzatti/dash.vim' " open Dash for documentation
Plug 'editorconfig/editorconfig-vim' " apply .editorconfig settings
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/webapi-vim' " required for vim-gist
Plug 'christoomey/vim-tmux-runner' " use TMUX and vim nicely

"{{{2
call plug#end()

" General Settings {{{1

" General Application {{{2
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set autoread
set hidden

" User Interface {{{2
set laststatus=2
set ruler
set wildmenu
set tabpagemax=40
set cursorline
set nocursorcolumn
set number
set norelativenumber
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

" Colors {{{2
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme dracula

" Swap & Backup Files "{{{2
set directory=$HOME/.vim/swp
set backupdir=~/.vim/.backup
set nobackup
set nowritebackup

" Indentation {{{2
set autoindent
filetype plugin indent on
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Search {{{2
set incsearch
set nohlsearch
set showmatch
set ignorecase
set smartcase
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Folding {{{2
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" Text Rendering {{{2
set encoding=utf-8
scriptencoding utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5

" Miscellaneous {{{2
set confirm
set modeline
set modelines=5
set nrformats-=octal
" set shell=/usr/bin/local/zsh
set nospell
set exrc
set nostartofline
set textwidth=80

" Undo "{{{2
set undofile
set undodir=~/.vim/undodir

" Plugin Settings {{{1

" christoomey/vim-tmux-navigator {{{2
let g:tmux_navigator_save_on_switch = 1

" SerVer/ultisnips {{{2
let g:UltiSnipsSnippetsDir="~/.dotfiles/ultisnips"

" sheerun/vim-polyglot {{{2
let g:vim_markdown_new_list_item_indent=0
let g:vim_markdown_auto_insert_bullets = 0

" junegunn/fzf.vim {{{2
let g:fzf_action = {
      \ 'ctrl-t': 'tab-split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_buffers_jump = 1

" scrooloose/nerdtree {{{2
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.swp']
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapPreviewSplit = "gs"
let NERDTreeMapOpenVSplit="v"
let NERDTreeMapPreviewVSplit="gv"

" mattn/vim-emmet {{{2
let g:user_emmet_leader_key=','

" mhinz/vim-signify {{{2
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1

" luochen1990/rainbow {{{2
let g:rainbow_active=1

" scrooloose/nerdcommenter {{{2
let g:NERDSpaceDelims = 1

" editorconfig/editorconfig-vim {{{2
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" miyakogi/conoline.vim {{{2
let g:conoline_auto_enable = 1

" itchyny/lightline.vim {{{2
let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'cocstatus', 'gitbranch', 'obsession' ],
      \     [ 'readonly', 'filename', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'fugitive#head',
      \   'obsession': 'ObsessionStatus'
      \ }
      \ }

" szw/vim-maximizer {{{2
let g:maximizer_set_default_mapping = 0

" edkolev/tmuxline.vim {{{2
let g:tmuxline_preset = 'full'

" netrw {{{2
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" christoomey/vim-tmux-runner {{{2
let g:VtrUseVtrMaps = 1


" Commands {{{1

" neoclide/coc.nvim {{{2
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

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

" check_back_space() {{{2
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show_documentation() {{{2
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
nnoremap <silent> K :call <SID>show_documentation()<CR>
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

" neoclide/coc.nvim {{{2
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
augroup json_config_files
  au!
  autocmd BufNewFile,BufRead .prettierrc,.eslintrc set filetype=json
augroup end

" vim: fdm=marker fdl=1
