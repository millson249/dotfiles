let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
"set termguicolors

set number relativenumber
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on
syntax enable

"set autoread
"au FocusGained,BufEnter * checktime

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

" Encoding and file type
set encoding=utf8
set ffs=unix,dos

" Indentation
"set tabstop=8
set tabstop=4
"set softtabstop=8
set softtabstop=4
"set shiftwidth=8
set shiftwidth=4
set expandtab
set smarttab
set cino=:0,t0,l1

set autoindent
set smartindent
set nowrap

set laststatus=2

set tags=tags,./tags;$HOME

" Begin plug.vim
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
" - Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-eunuch'

" End plug.vim
call plug#end()
