set nocompatible
set number
set expandtab
set tabstop=4
set shiftwidth=4
filetype off 


noremap ; :
noremap : ;
inoremap jj <ESC>

map <F4> ;NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

filetype plugin indent on   
