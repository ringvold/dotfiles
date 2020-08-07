" Quickly edit and source ~/.vimrc.
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Remap leader to ",".
let mapleader = ","

" Exit insert mode
:imap jj <Esc>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Disable the arrow keys. You'll thank me later.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv


" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files<CR>

" Navigate open buffers
nmap <Space> :e#<Return>

" Remap escape in terminal mode so I can get out
:tnoremap <Esc> <C-\><C-n>
