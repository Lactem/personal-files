" File copied from github.com/lactem/personal-files/macos/init.vim to
" ~/.config/nvim/init.vim

set backspace=indent,eol,start
filetype indent plugin on
syntax on
set showmatch
set smartindent
set cmdheight=2
set number
set shiftwidth=2
set softtabstop=4
set expandtab
set encoding=utf-8
let python_highlight_all = 1

call plug#begin('~/.vim/vim-plug-plugins')

" Airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'

call plug#end()
