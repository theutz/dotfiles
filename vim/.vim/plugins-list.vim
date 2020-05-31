"          oo                        dP                   oo                   
"                                    88                                        
" dP   .dP dP 88d8b.d8b.    88d888b. 88 dP    dP .d8888b. dP 88d888b. .d8888b. 
" 88   d8' 88 88'`88'`88    88'  `88 88 88    88 88'  `88 88 88'  `88 Y8ooooo. 
" 88 .88'  88 88  88  88    88.  .88 88 88.  .88 88.  .88 88 88    88       88 
" 8888P'   dP dP  dP  dP    88Y888P' dP `88888P' `8888P88 dP dP    dP `88888P' 
"                           88                        .88                      
"                           dP                    d8888P                       

" Appearance {{{
Plug 'itchyny/lightline.vim' " status bar
Plug 'kshenoy/vim-signature' " show marks in gutter
Plug 'luochen1990/rainbow' " rainbow parentheses
Plug 'miyakogi/conoline.vim' " set cursor line highlight only in current window

" Color Schemes {{{
Plug 'jacoborus/tender.vim'
Plug 'haishanh/night-owl.vim'
Plug 'dracula/Vim', {'as': 'dracula'}
Plug 'ayu-theme/ayu-vim'
Plug 'sainnhe/lightline_foobar.vim'

" Session {{{
Plug 'tpope/vim-obsession' " track sessions better

" Completion {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language server support
Plug 'sirver/UltiSnips' " snippets

" Languages {{{
Plug 'scrooloose/nerdcommenter' " commenting
Plug 'sheerun/vim-polyglot' " big language pack
Plug 'mattn/emmet-vim' " emmet (zen coding) support
Plug 'jparise/vim-graphql' " graphql language support
Plug 'jxnblk/vim-mdx-js' " mdx language support
Plug 'inkarkat/vim-SyntaxRange' " allow syntax definitions as a subset of a filetype
Plug 'alampros/vim-styled-jsx' " styled-jsx for nextjs
Plug 'tmux-plugins/vim-tmux' " integration for tmux files

" Editing {{{
Plug 'tpope/vim-abolish' " smart substitution
Plug 'tpope/vim-surround' " change surrounding text
Plug 'simnalamburt/vim-mundo' " undo history
Plug 'tpope/vim-repeat' " make more commands repeatable with .
Plug 'tpope/vim-speeddating' " auto-incrementable dates
Plug 'chrisbra/unicode.vim' " complete support for unicode digraphs
Plug 'wellle/targets.vim' " Add more text objects
Plug 'mattn/gist-vim' " edit GitHub gists with vim
Plug 'kburdett/vim-nuuid' " Work with uuids in vim
Plug 'fadein/vim-FIGlet' " Use figlet in vim

" Version Control "{{{
Plug 'tpope/vim-fugitive' " git interface
Plug 'sodapopcan/vim-twiggy' " git branch management
Plug 'tpope/vim-rhubarb' " github client for fugitive
Plug 'mhinz/vim-signify' " show git changes in gutter
Plug 'Xuyuanp/nerdtree-git-plugin' " show git changes in NERDTree
Plug 'airblade/vim-rooter' " change project directory to VCS root

" Navigation {{{
Plug 'tpope/vim-unimpaired' " pairs of keyboard shortcuts
Plug 'junegunn/fzf', { 'do': { ->fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy finder vim integration
Plug 'scrooloose/nerdtree' " file tree
Plug 'tmux-plugins/vim-tmux-focus-events' " capture mouse events from tmux
Plug 'moll/vim-bbye' " adds :Bdelete and :Bwipeout
Plug 'szw/vim-maximizer' " Easy window maximization

" Integrations {{{
Plug 'rizzatti/dash.vim' " open Dash for documentation
Plug 'editorconfig/editorconfig-vim' " apply .editorconfig settings
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/webapi-vim' " required for vim-gist
Plug 'christoomey/vim-tmux-runner' " use TMUX and vim nicely

" vim: fdm=marker fdl=0
