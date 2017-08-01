""" Vundle package manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/tComment'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'

""" Settings
call vundle#end()
filetype indent plugin on

syntax on
colorscheme desert

set autoindent
set smarttab
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2

set ignorecase
set smartcase
set number
set backspace=indent,eol,start
set hlsearch
set scrolloff=8

""" Text width
set textwidth=0

""" Show whitespace at end of all lines
let g:better_whitespace_filetypes_blacklist=[]

""" tComment, better shortcuts
map <c-c> <c-_><c-_>

""" Ignore pyc etc in command T
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg

""" Shortcut for jumping to definition in YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoTo<CR>

""" Disable pylint etc.
let g:syntastic_python_checkers = ['flake8']

""" Persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

""" Puts cursor on same line as when last closing
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

""" Automatically set tab-mode if the file is written in tabs
function Kees_settabs()
  if len(filter(getbufline(winbufnr(0), 1, 1000), 'v:val =~ "\\t"')) > len(filter(getbufline(winbufnr(0), 1, 1000), 'v:val =~ "    "'))
    setlocal noet sts=0
  endif
endfunction
autocmd BufReadPost * call Kees_settabs()
