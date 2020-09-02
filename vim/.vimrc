"""
""" Plugins
"""

call plug#begin('~/.vim/plugged')
  " Color schemes
  Plug 'altercation/vim-colors-solarized'
  Plug 'endel/vim-github-colorscheme'
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'

  " Syntax highlighers
  Plug 'neovimhaskell/haskell-vim'
  Plug 'pearofducks/ansible-vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'rust-lang/rust.vim'

  " Various plugins
  " Shows file diffs
  Plug 'airblade/vim-gitgutter'
  " Python auto completion:
  Plug 'davidhalter/jedi-vim'
  " Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
  " Status line
  Plug 'itchyny/lightline.vim'
  " Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Tagbar
  Plug 'majutsushi/tagbar'
  " Flake 8
  Plug 'nvie/vim-flake8', { 'do': 'pip install flake8' }
  " git commit editing
  Plug 'rhysd/committia.vim'
  " Nerdtree
  Plug 'scrooloose/nerdtree'

call plug#end()

"""
""" General settings
"""

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
"Highlights current line
set cursorline
" Enables filetype detection
filetype on
" Enables filetype-specific plugins
filetype plugin on
" Load the indent file for specific filetypes
filetype plugin indent on
" Show trailing whitespace chars
set list
set listchars=tab:>·,trail:·,nbsp:~
" Select font for Gvim
set guifont=Roboto\ Mono\ Medium\ 10

"""
""" Color scheme
"""

colorscheme PaperColor
set background=dark
set t_Co=256
syntax on

"""
""" Filetypes
"""

" - shiftwidth: Amount of indentation used for each nesting level
" - tabstob:    Amount of spaces that a tab equals to
" - expandtab:  Expand tab to spaces
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set textwidth=79
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab|set textwidth=79
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType rst set tabstop=2|set shiftwidth=2|set expandtab|set textwidth=79
autocmd FileType markdown set tabstop=2|set shiftwidth=2|set expandtab|set textwidth=79

"""
""" Key mappings
"""

" Map the combinations Command-Shift-Right, Command-Shift-Left, to switch to the next and previous tabs respectively"
noremap <d-s-right> :tabnext<cr>
noremap <d-s-left> :tabprevious<cr>
" Map Ctrl-Left/Ctrl-Right to previous/next tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Map Ctrl-c/Ctrl-v to copy/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" Map F5 to delete all trailing whitespaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"""
""" Plugin configuration
"""

""" jedi-vim
" Shows docstrings of selected function or class
let g:jedi#documentation_command = "<C-d>"
" Shows auto-completion options
let g:jedi#completions_command = "<C-Space>"

""" lightline.vim
let g:lightline = {
     \ 'colorscheme': 'solarized',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
     \ }
     \ }
set ls=2

""" nerdtree
let g:NERDTreeDirArrowExpandable = "\u002B"
let g:NERDTreeDirArrowCollapsible = "\u2212"
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '\~$']
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeWinSize = 35
" Automatically close the tab if all that's left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Hide the GitGutter signcolumn for the NerdTree tab
autocmd FileType nerdtree setlocal signcolumn=no

""" vim-flake8
" https://github.com/nvie/vim-flake8
autocmd BufWritePost *.py call Flake8()

""" vim-gitgutter
let g:gitgutter_sign_added = "\u25B6"
let g:gitgutter_sign_modified = "\u25C6"
let g:gitgutter_sign_modified_removed = "\u25C6"
let g:gitgutter_sign_removed = "\u2581"
let g:gitgutter_sign_removed_first_line = "\u2580"
set updatetime=500

""" vim-markdown
" Disable folding
let g:vim_markdown_folding_disabled = 1
