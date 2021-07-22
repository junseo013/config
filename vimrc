set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Vundle For Plugin Manager
Plugin 'gmarik/Vundle.vim'

" GUI related plugins
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'The-NERD-Tree'
Plugin 'ctrlpvim/ctrlp.vim'

" For commenting
Plugin 'chrisbra/vim-commentary' 

" Git GUI 
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'blueyed/vim-diminactive'
Plugin 'Raimondi/delimitMate'

" colorschemes
Plugin 'joshdick/onedark.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'

" Auto Complete
Plugin 'valloric/youvompleteme' " need compiling
Plugin 'CmdlineComplete'

" Jumping to definition
Plugin 'jlanzarotta/bufexplorer'
Plugin 'universal-ctags/ctags'

" Jupyter-vim
Plugin 'jupyter-vim/jupyter-vim'

call vundle#end()

set t_Co=256

nmap <F8> :Tagbar<CR>
" for NERDTree
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" for auto bracket
let delimitMate_expand_cr=1

" for indent guide
" let g:indentguides_spacechar = '??
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='badwolf'
set laststatus=2 " turn on bottom bar
let mapleader = "q"
nnoremap <leader>w :bp<CR>
nnoremap <leader>q :bn<CR>

" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

" for termdebug config
packadd termdebug
let g:termdebug_wide=1
let g:termdebug_leftsource = 1
let g:termdebug_focussource = 1
let g:termdebug_disable_toolbar = 1

syntax enable 
filetype plugin indent on
highlight Comment term=bold cterm=bold ctermfg=4

" tabs and spaces
set ts=2
set sts=2
set shiftwidth=2
set expandtab

" search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" numbering
set nu              " show line numbers
" set relativenumber  " show relative numbering

" auto indent
set autoindent
set cindent
set smartindent cinwords=if,else,for,while,try,except,finally,def,class

set autowrite
set autoread
set paste
set bs=eol,start,indent " using backspace
set history=256

" for vim-airline
" set laststatus=2    " turn on bottom bar
set noshowmode      " no show for default
set showmatch 
set smarttab

" Don't make swap file
set noswapfile

" tmux color
set term=screen-256color

set ruler

set fileencodings=rtf8,euc-kr

set background=dark
colorscheme jellybeans

set tags+=/home/junseo/2021-1/OS/project3-hello-scheduler-team-9/tags

"-------------key mapping--------------

" for NERDTree
map <C-n> :NERDTreeToggle<CR>

"Leader
" let mapleader=" "   " leader is space

" y d p P -- Quick copy&paste into system clipboard
"nmap <Leader>y "+y
"nmap <Leader>d "+d 
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P














 
