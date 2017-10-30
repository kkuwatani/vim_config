"add plugins managed by pathogen in the /.vim/bundle folder
execute pathogen#infect()
syntax on
filetype plugin indent on

"light line configs
set laststatus=2

" syntax and style configs
filetype on
colorscheme Tomorrow-Night

"functional aesthetic configs
set number
set colorcolumn=80
set hlsearch
set showmatch
" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
