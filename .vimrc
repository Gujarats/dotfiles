"this is syntastic recommend setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0




set clipboard=unnamedplus

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

"List Core Plugin for laravel

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'xsbeats/vim-blade'
Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

nmap <S-Enter> O<Esc>
inoremap <F5> <c-o>:w<cr>

map <F2> :NERDTreeToggle<CR>

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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

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
let g:solarized_termcolors=256
set t_Co=256 
set background=dark
colorscheme solarized

" Display line numbers
set number

" Utf8 standard encoding
set encoding=utf8

"
" Files, backup & undo
"

set nobackup
set nowb
set noswapfile

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
