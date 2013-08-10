set nocompatible " No compatbile with vi

" Localization
set keymap=russian-jcukenwin " Set russian layout

" Search
set iminsert=0
set imsearch=0
set hlsearch        " Highlight all matches
set ignorecase      " Ignore case in patterns

" Visual/Interface

" Gnome term suppors 256 colors
if $COLORTERM == 'gnome-terminal' 
    set t_Co=256
endif

colors herald       " Color scheme
set number          " Display line numbers
set novisualbell    " Disable flashing
set showcmd         " Display command 

" Status line
set laststatus=2            " Always dislpay status line
set statusline=%-3.3n\      " Buffer number
set statusline+=%t          " Short filename
set statusline+=\ [%{&ff}]  " Format  
set statusline+=%m          " Modified flag
set statusline+=%r          " Readonly flag
set statusline+=%y          " Filetype
set statusline+=%=          " Separator
set statusline+=%l,         " Cursor line
set statusline+=%c          " Cursor column
set statusline+=\ %P(%L)    " Percent through file (total lines)

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent

" Keymappings
map N Nzz
map n nzz
noremap ; :
noremap : ;
inoremap jj <ESC>


" Vundle
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'shawncplus/phpcomplete.vim'

filetype plugin indent on   

" NERDTree configuration
map <F4> ;NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

