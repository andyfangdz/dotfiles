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

  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-fugitive')
  " fzf
  call dein#add('~/.fzf')
  call dein#add('junegunn/fzf.vim')

  call dein#add('sheerun/vim-polyglot')

  " completions
  call dein#add('roxma/nvim-completion-manager')

  " rust
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('roxma/nvim-cm-racer')

  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-scripts/cream-showinvisibles')

  call dein#add('hecal3/vim-leader-guide')
  let prettier_ft = ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']
  call dein#add('prettier/vim-prettier', {
              \ 'build': 'yarn install',
              \ 'on_ft': prettier_ft
              \ })
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

scriptencoding utf-8
set encoding=utf-8

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = "-"
"End dein Scripts-------------------------
let g:prettier#config#parser = 'babylon'

let g:airline#extensions#tabline#enabled = 1

:au VimLeave * set guicursor=a:ver10-blinkon1
ca w!! w !sudo tee "%"
let mapleader = " "
let g:lmap =  {}

nnoremap <leader>ev :split $MYVIMRC<CR> 
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ws :call Cream_list_toggle("n")<CR>


call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>


"Nerdtree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>nt :NERDTreeToggle<CR>

"Language specific formatting
autocmd FileType javascript nnoremap <buffer> <leader>ff :Prettier<CR>
autocmd FileType rust       nnoremap <buffer> <leader>ff :RustFmt<CR>
"Natual splitting
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:rustfmt_autosave = 1
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --color "always"
  \ -g "*.{zsh,sh,jsx,js,css,json,md,html,config,py,cpp,c,go,rb,conf,ts,tsx,java,kt}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

