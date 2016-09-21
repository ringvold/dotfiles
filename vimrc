set nocompatible              " be iMproved, required
filetype on                   " required for compatibility with Mac OS X, See issue #167
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'sotte/presenting.vim'

" All of your Plugins must be added before the following line
call vundle#end() " required

" Jump to the marked line and column on ', and only the marked line on `.
nnoremap ' `
nnoremap ` '

" Remap leader to ",".
let mapleader = ","

" Keep 1000 commands worth of history.
set history=1000

" Allow 1000 levels of undo.
set undolevels=1000

" Ignore some files when autocompleting.
set wildignore=*.swp,*.pyc,*.class,spec/tmp

" Change the terminal's title.
set title

" Don't create backup or swap files.
set nobackup
set noswapfile

" Maintain at least 3 lines worth of context around the cursor.
set scrolloff=3

" Show line numbers
set number

" Set color scheme
colorscheme busybee

" Enable syntax highlighting
syntax on

" Load plugins and indentation preferences based on file type.
filetype on
filetype plugin on
filetype indent on

" Quickly edit and source ~/.vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Allow opening new files without writing changes first.
set hidden

" Don't wrap lines.
set nowrap

" A tab is 2 spaces.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Round indentation to multiples of shiftwidth when indenting.
set shiftround

" Enable automatic indentation.
set autoindent
set copyindent

" Show search matches as you type.
set incsearch

" Set default encoding
"set encoding=utf-8 " Got error for some reason.

" Disable the arrow keys. You'll thank me later.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Display a list of completion alternatives.
set wildmenu

" Allow deleting anything with backspace.
set backspace=indent,eol,start

" Always show the status line.
set laststatus=2

" Customize the status line
set statusline=%f\ (%{&fenc})%=\ %l/%L

" Activate Limelight when starting Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Detect the gist filetype from the filename
let g:gist_detect_filetype = 1

" Convenience methods to run the current file
autocmd FileType ruby nmap <Leader>r :!ruby %<cr>

" Navigate open buffers
nmap <Space> :e#<Return>

"" Load local override if present
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
