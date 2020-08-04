set nocompatible              " be iMproved, required
filetype on                   " required for compatibility with Mac OS X, See issue #167
filetype off                  " required

" Enables case insensitiv tab completion on commands. Eg. :lime <TAB> resolves
" to :Limelight
set ignorecase

" Use relative line numbers
set relativenumber

" Show space as dot
set list
set listchars=space:·

" Allow 1000 levels of undo.
set undolevels=1000

set undodir=~/.vim/undodir
set backupdir=~/.vim/backup

" Ignore some files when autocompleting.
set wildignore=*.swp,*.pyc,*.class,spec/tmp

" Change the terminal's title.
set title

" Don't create backup or swap files.
set nobackup
set noswapfile
"
" Maintain at least 3 lines worth of context around the cursor.
set scrolloff=3

" Set color scheme
"colorscheme busybee

" Enable syntax highlighting
syntax on

" Load plugins and indentation preferences based on file type.
filetype on
filetype plugin on
filetype indent on

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

"set encoding=utf-8 " Got error for some reason.

" Allow deleting anything with backspace.
set backspace=indent,eol,start

" Customize the status line
" set statusline=%f\ (%{&fenc})%=\ %l/%L

" Set filetype markdown for .md files
autocmd BufRead,BufNew *.md set filetype=markdown

" Detect the gist filetype from the filename
let g:gist_detect_filetype = 1

" Fra svv vimrc

" Mark the 51st and 73rd column (for git commit summary messages)
augroup gitcommit_filetype
  autocmd!
  au FileType gitcommit :set cc=51,73
augroup end

  " Force block cursor
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

"" Load local override if present
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
