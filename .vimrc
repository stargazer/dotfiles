" Load plugins from ~/.vim/bundle
execute pathogen#infect()

" Syntax highlighting
syntax on
" Vi incompatible features
set nocompatible
" Line number
set number
" Prevent the cursor from changing the current column when jumping to other lines
set nostartofline
" Expand tab to spaced
set expandtab
" Automatic indentation
set autoindent
" Show matching braces
set showmatch
" Enable mouse use in all modes
set mouse=a
"Sets vim to use 256 colors, which enables using any kind of colorscheme
set t_Co=256
"Highlights current line
set cursorline
"Displays filename at bottom of vim
set ls=2
" Enables filetype detection
filetype on
" Enables filetype-specific plugins
filetype plugin on
" Load the indent file for specific filetypes
filetype plugin indent on
" Show trailing whitespace chars
"set list
"set listchars=tab:>·,trail:·,nbsp:~

" Select color scheme
" colorscheme molokai
" colorscheme github
" Use the gruvbox color scheme with a dark background
set background=dark
colorscheme gruvbox

" Select font
set guifont=Ubuntu\ Mono\ 11

" -- Set rules for specific filetypes --
" - shiftwidth: Amount of indentation used for each nesting level
" - tabstob:    Amount of spaces that a tab equals to
" - expandtab:  Expand tab to spaces
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set textwidth=79
autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab|set textwidth=79
autocmd FileType html set tabstop=4|set shiftwidth=4|set expandtab

" Map the combinations Command-Shift-Right, Command-Shift-Left, to switch to the next and previous tabs respectively"
noremap <d-s-right> :tabnext<cr>
noremap <d-s-left> :tabprevious<cr>

" When running Vim, open NERDTree
" autocmd VimEnter *.py NERDTree
" When opening a new Vim tab, run Tagbar
autocmd TabEnter *.py Tagbar

" flake8-vim
" https://github.com/andviro/flake8-vim
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeAggressive = 0
let g:PyFlakeCWindow = 6 

" vim-markdown
" Disable folding
let g:vim_markdown_folding_disabled = 1

"Map numerical pad of Mac keyboard to numbers"
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -
imap <Esc>OX =

" Map Ctrl-Left/Ctrl-Right to previous/next tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Map Ctrl-c/Ctrl-v to copy/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
