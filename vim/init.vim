set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set mouse=a

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/.cache/dein')
  call dein#begin($HOME.'/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Colortheme and One Dark
  call dein#add('joshdick/onedark.vim')

  " airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " fzf
  call dein#add('~/.fzf')
  call dein#add('junegunn/fzf.vim')

  call dein#add('sheerun/vim-polyglot')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Rip-Rip/clang_complete')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('vim-scripts/cream-showinvisibles')

  call dein#add('hecal3/vim-leader-guide')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
silent! colorscheme onedark
let g:airline_theme='onedark'
" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

let g:airline#extensions#tabline#enabled = 1

:au VimLeave * set guicursor=a:ver10-blinkon1

let mapleader = " "
let g:lmap =  {}

nnoremap <leader>ev :split $MYVIMRC<CR> 
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ws :call Cream_list_toggle("n")<CR>



call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

