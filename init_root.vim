" File copied from github.com/lactem/personal-files/init_root.vim to
" /root/.config/nvim/init.vim

set backspace=indent,eol,start
filetype indent plugin on
syntax on
set smartindent
set cmdheight=2
set number
set shiftwidth=2
set softtabstop=4
set expandtab
set encoding=utf-8

call plug#begin('~/.vim/vim-plug-plugins')

" Airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'

call plug#end()
