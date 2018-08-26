filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set hidden
set hlsearch
set laststatus=2
set noshowmode
set mouse=a
set noundofile
set number
set wildmenu
set autochdir
set noswapfile

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
call plug#end()

let mapleader=","

try
    colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/

endtry

let g:lightline = {'colorscheme': 'nord'}

nnoremap gb :ls<CR>:b<Space>

set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

let g:ctrl_show_hidden = 1

set wildmode=list:full
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*;*/.hg/**/*,*/svn/**/*,*/node_modules/**/*
set wildignore+=tags
set wildignore+=*.tar.*
