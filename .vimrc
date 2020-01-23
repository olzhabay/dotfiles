" vim : foldmethod=marker :
" Dependencies:
"  - It requires to have the following env variables:
"    1. $CLANG_COMPLETE_LIB
"    2. $GIT_AUTHOR_NAME
" Bundle
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'SuperTab'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlp.vim'
Plugin 'linediff.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
call vundle#end()
" Main options 
filetype plugin indent off
filetype plugin on
filetype indent off
set autoindent
syntax on

" Filename autocomplete
set wildmode=longest,list,full
set wildmenu

" turn absolute line numbers on
set number
set nu

" autorefresh files
set autoread

" Interface settings 
"## 256 terminal
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_diffmode="high"
set background=dark
colorscheme solarized 
set term=xterm-256color

"## More options
set ruler
set incsearch
set hlsearch
set wildmenu
"set hidden  " Useful feature, to have multiples buffer open

"## Cursor
set cursorline
match Error /{{{\|}}}/
" General settings 
"Set backup off since we are always using git :D
set noswapfile
set nobackup
set nowritebackup

"Correct broken redraw
set ttyfast
set noerrorbells
set novisualbell
set t_vb=
set lazyredraw

"Indentation
set shiftwidth=3
"set expandtab
set tabstop=3
"set backspace=3
set foldmethod=marker
set cino=N-s
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
inoremap <Nul> <C-n>

"uncategorized
set mouse=a
set exrc
set wildignore=*.o,*.class,*.pyc

highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufEnter,BufNew *.log setlocal nowrap

" ---------------------------------------------------------------------
" Gvim 
" ---------------------------------------------------------------------
if has('gui_running')
  set guifont=Monaco\ 11
  set linespace=2    "Better line-height
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" ---------------------------------------------------------------------
"Key-binding 
" ---------------------------------------------------------------------
let mapleader = " "
nnoremap Q <Nop>

" Tabs
map <silent> <F2> :tabprevious<Enter>
map <silent> <F3> :tabnext<Enter>
map <silent> <F4> :tabnew<Enter>
map <silent> <F9> :NERDTreeToggle<Enter>

"Customized shortcuts
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>w :w!<cr>
nnoremap <silent> <leader>e :Gstatus<CR>
nnoremap <silent> <leader>E :bd .git/index<CR>
nnoremap <silent> <leader>a :copen<CR>
nnoremap <silent> <leader>A :cclose<CR>
nnoremap <silent> <leader>d :Gdiff<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
map <silent> <F5> :noh<Enter>

"Great map which saves the file in sudo mode, something like `sudo !!`
cnoremap w!! w !sudo tee >/dev/null % 

ab W w
ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
ab WQA wqa
ab Wqa wqa
"vim-airline 
set laststatus=2
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='powerlineish'

" ---------------------------------------------------------------------
"NERDTree 
" ---------------------------------------------------------------------
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 0
 
" ---------------------------------------------------------------------
" Tagbar 
" ---------------------------------------------------------------------
let g:tagbar_compact = 1
let g:tagbar_width = 30

" ---------------------------------------------------------------------
"SuperTab | utisnipts 
" ---------------------------------------------------------------------
let g:UltiSnipsExpandTrigger        = "<c-j>"
let g:UltiSnipsJumpForwardTrigger   = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:SuperTabDefaultCompletionType = "<C-n>"

" ---------------------------------------------------------------------
" Fugitive 
" ---------------------------------------------------------------------
set diffopt+=vertical
set updatetime=250
"source ~/.vimrc.local"
