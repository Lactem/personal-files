" File copied from github.com/lactem/personal-files/init.vim to
" ~/.config/nvim/init.vim

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

" ALE plugin
Plug 'w0rp/ale'
let g:ale_fixers = { 'javascript': ['eslint'] }
" Map shortcut ,f to run linter fix
let mapleader=","
nmap <leader>f <Plug>(ale_fix)

" Deoplete and Flow
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
let g:deoplete#enable_at_startup=1

call plug#end()
