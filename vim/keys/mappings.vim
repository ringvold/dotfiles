" Quickly edit and source ~/.vimrc.
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Remap leader to ",".
let mapleader = ","

" Exit insert mode
:imap jj <Esc>

" Jump to the marked line and column on ', and only the marked line on `.
nnoremap ' `
nnoremap ` '

" Disable the arrow keys. You'll thank me later.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files<CR>

" Navigate open buffers
"nmap <Space> :e#<Return>

" Remap escape in terminal mode so I can get out
:tnoremap <Esc> <C-\><C-n>
