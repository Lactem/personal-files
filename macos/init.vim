" File copied from github.com/lactem/personal-files/macos/init.vim to
" ~/.config/nvim/init.vim

let mapleader="," " Map ',' to leader (default is '\' but ',' is easier to use)
set clipboard=unnamed " Use system clipboard
set backspace=indent,eol,start " Make backspace delete line breaks and indents
filetype indent plugin on " Automatically recognize file types
syntax on
set showmatch " Show matching [] {} ()
set cmdheight=2 " More room to see vim commands (default is 1)
set number
set encoding=utf-8

" Use Python3 binaries
let g:python2_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

" Split navigations: ctrl+j, ctrl+k, ctrl+h, ctrl+l are mapped to left, right, up, down, respectively
" For use with :sp <file> and :vs <file> to open files in vertical and horizontal splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Flag extra whitespace and use proper PEP 8 indentation
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4 " Make << and >> move by 2 (should be 4 for PEP 8, so it has to be done twice)
    \ set textwidth=79
    \ set expandtab " Insert softtabstop (4) spaces each time <TAB> is pressed
    \ set autoindent smartindent " Apply indentation of the current line to the next, and react to code syntax/style
    \ set fileformat=unix

call plug#begin('~/.vim/vim-plug-plugins')

" Airline (status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'

" File browsing with NERDTree
Plug 'scrooloose/nerdtree'
autocmd vimenter * NERDTree | wincmd p " Open NERDTree automatically when vim starts up
" Use Ctrl+n to toggle NERDTree
noremap <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif

" Python code folding
Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1 " Show docstrings even when functions are hidden
" Use spacebar to toggle folds based on syntax.
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Auto-indent for proper PEP 8 compliance
Plug 'Vimjas/vim-python-pep8-indent'

" Code completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Virtual environment support for YouCompleteMe
let pipenv_venv_path = system('pipenv --venv')
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python3'
else
  let g:ycm_python_binary_path = 'python3'
endif
" Close the autoclomplete window once we're done with it
let g:ycm_autoclose_preview_window_after_completion=1
" Map leader+g to jump to the definition of a function
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" PEP 8 checking by pressing <F7> to run flake8
Plug 'nvie/vim-flake8'

" Fuzzy finding and more
Plug 'Shougo/denite.nvim'

" TODO: Maybe add syntastic for file syntax

call plug#end()
