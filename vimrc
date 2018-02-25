"add plugins managed by pathogen in the /.vim/bundle folder
execute pathogen#infect()
filetype plugin indent on
syntax on

" syntax and style configs
filetype on
colorscheme Tomorrow-Night

"functional aesthetic configs
set number
set colorcolumn=80
set hlsearch
set showmatch

"look this up - something about keeping more info in memory
set hidden
set history=100

"indentation and tab config - look this up more
filetype indent on
set nowrap
set tabstop=4 
set autoindent
set expandtab "tabs are actually actually spaces 
set shiftwidth=4 "specifically tabs = 4 spaces 
set smartindent "intelligent auto tabbing

"--- KEY REMAPS ---"
" remap leader key to space
let mapleader=" "
" press \  to turn off highlighting and clear any message already displayed
nnoremap <silent> \ :silent nohlsearch<CR>
" remap - to jump to end of line
nnoremap - $
" remap moving between split windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" split line (S is redundant with cc)
nnoremap S i<cr><esc><right>
" buffer navigation
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
" buffer splits
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

"--- PLUG INS ---"
"light line configs
set laststatus=2
set ttimeout ttimeoutlen=30
"nerd commenter configs
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
"nerd tree configs
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Command-T configs
"noremap <silent> <leader>tt :CommandT<CR>
"noremap <silent> <leader>bt :CommandTBuffer<CR>
"noremap <silent> <leader>tf :CommandTFlush<CR>

