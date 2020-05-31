"          oo                              dP                   
"                                          88                   
" dP   .dP dP 88d8b.d8b.          88d888b. 88 dP    dP .d8888b. 
" 88   d8' 88 88'`88'`88 88888888 88'  `88 88 88    88 88'  `88 
" 88 .88'  88 88  88  88          88.  .88 88 88.  .88 88.  .88 
" 8888P'   dP dP  dP  dP          88Y888P' dP `88888P' `8888P88 
"                                 88                        .88 
"                                 dP                    d8888P  

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-rooter' " change project directory to VCS root
  Plug 'alampros/vim-styled-jsx' " styled-jsx for nextjs
  Plug 'ayu-theme/ayu-vim' " color scheme
  Plug 'chrisbra/unicode.vim' " complete support for unicode digraphs
  Plug 'christoomey/vim-tmux-navigator' " navigate between vim and tmux seamlessley
  Plug 'christoomey/vim-tmux-runner' " use TMUX and vim nicely
  Plug 'dracula/Vim', {'as': 'dracula'} " color scheme
  Plug 'editorconfig/editorconfig-vim' " apply .editorconfig settings
  Plug 'edkolev/tmuxline.vim' " sync tmux and vim powerline
  Plug 'fadein/vim-FIGlet' " Use figlet in vim
  Plug 'haishanh/night-owl.vim' " color scheme
  Plug 'inkarkat/vim-SyntaxRange' " allow syntax definitions as a subset of a filetype
  Plug 'itchyny/lightline.vim' " status bar
  Plug 'jacoborus/tender.vim' " color scheme
  Plug 'jparise/vim-graphql' " graphql language support
  Plug 'junegunn/fzf', { 'do': { ->fzf#install() } } " fuzzy finder zsh plugin
  Plug 'junegunn/fzf.vim' " fuzzy finder vim integration
  Plug 'jxnblk/vim-mdx-js' " mdx language support
  Plug 'kburdett/vim-nuuid' " Work with uuids in vim
  Plug 'kshenoy/vim-signature' " show marks in gutter
  Plug 'liuchengxu/vim-which-key'
  Plug 'luochen1990/rainbow' " rainbow parentheses
  Plug 'mattn/emmet-vim' " emmet (zen coding) support
  Plug 'mattn/gist-vim' " edit GitHub gists with vim
  Plug 'mattn/webapi-vim' " required for vim-gist
  Plug 'mhinz/vim-signify' " show git changes in gutter
  Plug 'miyakogi/conoline.vim' " set cursor line highlight only in current window
  Plug 'moll/vim-bbye' " adds :Bdelete and :Bwipeout
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " language server support
  Plug 'rizzatti/dash.vim' " open Dash for documentation
  Plug 'sainnhe/lightline_foobar.vim' " color scheme
  Plug 'scrooloose/nerdcommenter' " commenting
  Plug 'scrooloose/nerdtree' " file tree
  Plug 'sheerun/vim-polyglot' " big language pack
  Plug 'simnalamburt/vim-mundo' " undo history
  Plug 'sirver/UltiSnips' " snippets
  Plug 'sodapopcan/vim-twiggy' " git branch management
  Plug 'szw/vim-maximizer' " Easy window maximization
  Plug 'tmux-plugins/vim-tmux' " integration for tmux files
  Plug 'tmux-plugins/vim-tmux-focus-events' " capture mouse events from tmux
  Plug 'tpope/vim-abolish' " smart substitution
  Plug 'tpope/vim-fugitive' " git interface
  Plug 'tpope/vim-obsession' " track sessions better
  Plug 'tpope/vim-repeat' " make more commands repeatable with .
  Plug 'tpope/vim-rhubarb' " github client for fugitive
  Plug 'tpope/vim-speeddating' " auto-incrementable dates
  Plug 'tpope/vim-surround' " change surrounding text
  Plug 'tpope/vim-unimpaired' " pairs of keyboard shortcuts
  Plug 'wellle/targets.vim' " Add more text objects
  Plug 'Xuyuanp/nerdtree-git-plugin' " show git changes in NERDTree
call plug#end()

" vim: fdm=marker fdl=1
