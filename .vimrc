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
Plugin 'vim-scripts/tComment'
Plugin 'oplatek/Conque-Shell'
Plugin 'wting/rust.vim'

""" Settings
syntax on
filetype indent plugin on
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
set mouse=a

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
let g:ctrlp_working_path_mode = ''
let g:ctrlp_cmd = 'CtrlPMixed'

""" Syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']

""" Show whitespace at end of lines
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
highlight ExtraWhitespace ctermbg=red guibg=red

""" F3 removes EOL spaces
map <F3> :%s/\(--\)\@<!\s\+$//g<CR> :noh<CR>
imap <F3> <C-o>:%s/\(--\)\@<!\s\+$//g<CR> <C-o>:noh<CR>

""" tComment, better shortcuts
map <c-c> <c-_><c-_>

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
