" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
" - Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"set tabstop=8
"set tabstop=4
set tabstop=2
"set softtabstop=8
"set softtabstop=4
set softtabstop=2
"set shiftwidth=8
"set shiftwidth=4
set shiftwidth=2
"set noexpandtab
set cino=:0,t0,l1

set background=dark
"color solazized

set tags=tags,./tags;$HOME
