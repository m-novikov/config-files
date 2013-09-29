set nocompatible " No compatbile with vi

set hidden
" Command line
set wildmode=list:longest,full
set wildmenu
" Vundle
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'joonty/vdebug'
"Bundle 'garbas/vim-snipmate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/neocomplcache.vim'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-fugitive'

Bundle 'calendar.vim'
Bundle 'jceb/vim-orgmode'


filetype plugin indent on   

" Localization
set keymap=russian-jcukenwin " Set russian layout
set encoding=utf-8
set fileencodings=utf-8,cp1251

" Search
set iminsert=0
set imsearch=0
set hlsearch        " Highlight all matches
set incsearch       " Incremet search
set ignorecase      " Ignore case in patterns

let loaded_matchparen=1 " Stop annoying jumps

" Swap 
set dir=~/.vim/swp

" Visual/Interface

" GUI
if has("gui_running") 
    set background=dark
    colors solarized
    set guifont=Terminus\ 14
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
endif

" Gnome term suppors 256 colors
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'rxvt-xpm' 
    set t_Co=16
    "let g:solarized_termcolors=256 " Plz spare my eyes
    "let g:solarized_termtrans=1 
    set background=dark
    colors solarized      " Color scheme
endif

set number          " Display line numbers
set novisualbell    " Disable flashing
set showcmd         " Display command 

" Status line
set laststatus=2            " Always dislpay status line
set statusline=%-3.3n\      " Buffer number
set statusline+=%t          " Short filename
set statusline+=\ [%{&ff}\|  " Format  
set statusline+=%{(&fenc==\"\"?&enc:&fenc)}]
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


"" Keymappings
let mapleader = ","
" Vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Moving around
nnoremap N Nzz
nnoremap n nzz
nnoremap ; :
nnoremap : ;
nnoremap L $
nnoremap H ^
inoremap jj <ESC>
inoremap <M-Space> <C-X><C-O>

"" Autocmd
autocmd FileType php    :setlocal colorcolumn=121

" NERDTree configuration
noremap <F12> :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

" Taglist configuration
noremap <F11> :TagbarToggle<CR>
nnoremap <leader>tb :TagbarToggle<CR>

nnoremap <leader>f     :FufCoverageFile<CR>
nnoremap <leader>t     :FufBufferTag<CR>
nnoremap <leader>b     :FufBuffer<CR>
nnoremap <leader>d     :FufDir<CR>
nnoremap <leader>at    :FufTag<CR>
" Neocomplete
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
