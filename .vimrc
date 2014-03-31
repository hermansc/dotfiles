""" Vundle package manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""" Plugins
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'

""" Settings
syntax on
filetype indent plugin on

set autoindent
set smarttab
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ignorecase
set smartcase
set number
set backspace=indent,eol,start
set hlsearch
set scrolloff=8

""" Text width
set textwidth=0
autocmd BufRead *.tex set textwidth=79

""" EasyMotion leader fixing. And I want bi-directional search as default.
let mapleader=","
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>q <Plug>(easymotion-bd-jk)

""" Ctrl-P, open tab as default.
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
\ }

""" Show whitespace at end of lines
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""" Persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

""" Folding / hide code
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

""" Golang bindings
au BufRead,BufNewFile *.go set filetype=go
set encoding=utf-8
colorscheme desert

""" Puts cursor on same line as when last closing
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif
