"add plugins managed by pathogen in the /.vim/bundle folder
execute pathogen#infect()

" syntax and style configs
filetype plugin indent on
filetype on
syntax on
let python_highlight_all=1
colorscheme molokai

"functional aesthetic configs
set number
set colorcolumn=120
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

"copy paste config
set clipboard=unnamed 

"mouse config (use options + click to use mouse)
set mouse=a

"make backspace work in INSERT
set backspace=2

"--- KEY REMAPS ---"
" remap leader key to space
let mapleader=" "
" press \  to turn off highlighting and clear any message already displayed
nnoremap <silent> \ :silent nohlsearch<CR>
" remap - to jump to end of line
nnoremap - $
vnoremap - $
" remap moving between split windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" split line (S is redundant with cc)
nnoremap S i<cr><esc><right>
" buffer navigation
nnoremap <C-m> :bn<CR>
nnoremap <C-n> :bp<CR>
noremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR> 
" need a shortcut for closing buffer
" buffer splits
noremap <leader>v :vsplit<cr>
noremap <leader>s :split<cr>
" faster scrolling
noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>
" indentation visual block stays
vnoremap < <gv
vnoremap > >gv
" search highlighted text
vnoremap // y/\V<C-R>"<CR>
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

"ctrlp configs
let g:ctrlp_working_path_mode = 0

"ctrsf configs
"default to compact mode (M to switch to normal mode)
let g:ctrlsf_default_view_mode = 'compact'
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"youcompleteme configs
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
"allows youcompleteme python venv detection (hacky)
let g:ycm_python_binary_path='/Users/kkuwatani/Envs/ground_control_venv/bin/python'
