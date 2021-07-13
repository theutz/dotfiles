if &compatible
  set nocompatible
endif

function! PackInit() abort
  packadd minpac

  call minpac#init()

  call minpac#add('k-takata/minpac', { 'type': 'opt'})
  call minpac#add('tpope/vim-surround')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('Alok/notational-fzf-vim')
  call minpac#add('blueyed/vim-diminactive')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('ferrine/md-img-paste.vim')
  call minpac#add('flazz/vim-colorschemes')
  call minpac#add('francoiscabrol/ranger.vim')
  call minpac#add('freitass/todo.txt-vim')
  call minpac#add('fvictorio/vim-textobj-backticks')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('junegunn/limelight.vim')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('junegunn/vim-peekaboo')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('mbbill/undotree')
  call minpac#add('rbgrouleff/bclose.vim')
  call minpac#add('rhysd/git-messenger.vim')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('sunaku/vim-shortcut')
  call minpac#add('thinca/vim-textobj-between')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('vimwiki/vimwiki')
  call minpac#add('srcery-colors/srcery-vim')
  call minpac#add('pineapplegiant/spaceduck', { 'branch': 'main' })
  call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() }})
  call minpac#add('theutz/toggle-number-style.vim', { 'branch': 'main' })
  call minpac#add('neoclide/coc.nvim', { 'branch': 'release' })
endfunction

""Plug 'edkolev/tmuxline.vim'

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus source $MYVIMRC | call PackInit() | call minpac#status()
