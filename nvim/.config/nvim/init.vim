"================================================================================================
"Quick command in insert mode
"================================================================================================
inoremap AA <Esc>A

"upper case 
imap UU _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>
imap uu _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>

"delete previous word
imap <leader>d _<Esc>vbdi

" copy paste with new line
:nmap p :pu<CR>
" copy from the end of the line
:nmap Y v^y

" changing between pane
:nmap <leader>d <C-w>j
:nmap <leader>a <C-w>h
:nmap <leader>s <C-w>k
:nmap <leader>f <C-w>l


"================================================================================================
"Quick command
"================================================================================================
nmap <S-Enter> O<Esc>
"f5 in insert mode to save
inoremap <F5> <c-o>:w<cr>

"f2 to show nerdTree
map <F2> :NERDTreeToggle<CR>

"shorcut for open new terminal
map <F3> :VTerm<CR>
"================================================================================================
"================================================================================================


"================================================================================================
"GO CONFIGURATION
"================================================================================================

"using sintastic with vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"shortcut for vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

"auto-import go
let g:go_fmt_command = "goimports"

"vim-go setup sintaks highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"================================================================================================
"================================================================================================

"================================================================================================
"VUNDLE CONFIGURATION & PLUGINS
"================================================================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'morhetz/gruvbox'
Plugin 'folke/tokyonight.nvim' 
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'sainnhe/gruvbox-material' "theme color


"GO Language
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'nvim/'}

"terminal
Plugin 'gujarats/split-term.vim'

"fancy statusline
Plugin 'vim-airline/vim-airline-themes' " themes for vim-airline
Plugin 'vim-airline/vim-airline' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"================================================================================================
"================================================================================================


"let vim to use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"set tags for ctags;  this is for go to declared method 
set tags=./tags;/

"this is for increament the alphabet a to b to c
set nf=octal,hex,alpha

"this is syntastic recommend setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"for copy paste from vim to clipboard 
set clipboard=unnamedplus

set nocompatible              " be iMproved, required
filetype off                  " required


"showing hidden files
let NERDTreeShowHidden=1

set ruler         " show the cursor position all the time

"make vim-airline shows up when open single file
set laststatus=2

"python 
let g:python_host_prog  = '/usr/bin/python'

"highlight cusor
set cursorline
set cursorcolumn

set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Auto read when file is changed from the outside
set autoread

"
" User Interface
"

" Set center of the scroll when moving vertically
set so=7

" Turn on wild menu
set wildmenu


" Show current position
set ruler

" Command bar height
set cmdheight=2

" Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Enable mouse
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" Smart case when searching
set smartcase

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Enable lazyredraw
set lazyredraw

" Simplify regex
set magic

" Show matching brackets
set showmatch

" No error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"
" Colors & Fonts
"
syntax on
set background=dark
colorscheme gruvbox

" Display line numbers
set number
set numberwidth=1

" Utf8 standard encoding
set encoding=utf8

"
" Files, backup & undo
"
set nobackup
set nowb
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile

"
" Text, tab & indentation
"

" Use space for tabs
set expandtab

" Enable smart tabs
set smarttab

" set tab width
set shiftwidth=4
set tabstop=4

" Set linebreak
set lbr
set tw=500

" Set auto indent
set ai

" Set smart indent
set si

" Wrap long lines
set wrap
