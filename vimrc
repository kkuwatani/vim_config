"add plugins managed by pathogen in the /.vim/bundle folder
execute pathogen#infect()

" syntax and style configs
filetype on
syntax on
colorscheme Tomorrow-Night

"functional aesthetic configs
set number
set colorcolumn=80
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR> "allows esc to stop hl search
set showmatch

"look this up - something about keeping more info in memory
set hidden
set history=100

"indentation and tab config - look this up more
filetype indent on
set nowrap
set tabstop=4 "look this up
set autoindent
set expandtab "tabs are actually actually spaces 
set shiftwidth=4 "specifically tabs = 4 spaces 
set smartindent "intelligent auto tabbing
