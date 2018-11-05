" File copied from github.com/lactem/personal-files/macos/init.vim to
" ~/.config/nvim/init.vim

let mapleader="," " Map ',' to leader (default is '\' but ',' is easier to use)
set clipboard=unnamed " Use system clipboard
set backspace=indent,eol,start " Make backspace delete line breaks and indents
filetype indent plugin on " Automatically recognize file types
set showmatch " Show matching [] {} ()
set cmdheight=2 " More room to see vim commands (default is 1)
set number
set encoding=utf-8

" Use ,h to toggle showing hidden characters (ex: tab shows as >-)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
map <leader>h :set list!<CR>

" Use Python3 binaries
"let g:python2_host_prog = '/usr/local/bin/python3'
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
let g:airline_theme='dracula'

" File browsing with NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=1 " Open NERDTree automatically when vim starts up
" Use Ctrl+n to toggle NERDTree
noremap <C-n> :NERDTreeTabsToggle<CR>

" Streamline Git commands inside the Vim window
Plug 'tpope/vim-fugitive'

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
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" PEP 8 checking by pressing <F7> to run flake8
Plug 'nvie/vim-flake8'

" Fuzzy finding and more from Denite
Plug 'Shougo/denite.nvim'

" Dark theme
Plug 'dracula/vim', {'as' : 'dracula'}

call plug#end()

" Denite (must be after plug#end) {{{
" Reset 50% winheight on window resize
augroup deniteresize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default',
        \'winheight', winheight(0) / 2)
augroup end

call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('file_rec', 'final_opts', [])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \'noremap')

nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <C-p>p :<C-u>DeniteProjectDir file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
nnoremap <leader>lr :<C-u>Denite references -mode=normal<CR>

highlight link deniteMatchedChar Special

" Ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ -S
set grepformat=%f:%l:%c:%m,%f:%l:%m
" }}}

syntax on
colorscheme dracula
