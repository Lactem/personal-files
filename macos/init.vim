" File copied from github.com/lactem/personal-files/macos/init.vim to
" ~/.config/nvim/init.vim

set clipboard=unnamed " Use system clipboard
set backspace=indent,eol,start " Make backspace delete line breaks and indents
filetype indent plugin on " Automatically recognize file types
syntax on
set showmatch " Show matching [] {} ()
set autoindent smartindent " Apply indentation of the current line to the next, and react to code syntax/style
set cmdheight=2 " More room to see vim commands (default is 1)
set number
set shiftwidth=2 " Make << and >> move by 2
set softtabstop=4 " Normal tab is 4 spaces
set expandtab " Insert softtabstop (ie: 4) spaces each time <TAB> is pressed
set encoding=utf-8

" Split navigations: ctrl+j, ctrl+k, ctrl+h, ctrl+l are mapped to left, right, up, down, respectively
" For use with :sp <file> and :vs <file> to open files in vertical and horizontal splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin('~/.vim/vim-plug-plugins')

" Airline (status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'

" Python code folding
Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1 " Show docstrings even when functions are hidden
" Use spacebar to fold based on syntax. vc and va are the commands to close and open folds
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

call plug#end()
