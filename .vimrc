"vim-go setup sintaks highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"let vim to use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"---- KEY BINDING VIMUX----
 " Run the current file with rspec
 map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

 " Prompt for a command to run
 map <Leader>vp :VimuxPromptCommand<CR>

 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>

 " Inspect runner pane
 map <Leader>vi :VimuxInspectRunner<CR>

 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>

 " Interrupt any command running in the runner pane
 map <Leader>vx :VimuxInterruptRunner<CR>

 " Zoom the runner pane (use <bind-key> z to restore runner pane)
 map <Leader>vz :call VimuxZoomRunner()<CR>

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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Plugin 'L9'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
"Plugin 'valloric/youcompleteme'
"Plugin 'xsbeats/vim-blade'
Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline' " fancy statusline
Plugin 'vim-airline/vim-airline-themes' " themes for vim-airline
"Plugin 'benmills/vimux'

Plugin 'chriskempson/base16-vim' "theme color

" html / templates
Plugin 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plugin 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plugin 'othree/html5.vim', { 'for': 'html' } " html5 support
Plugin 'mustache/vim-mustache-handlebars' " mustach support
Plugin 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } " jade support

" JavaScript
Plugin 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plugin 'moll/vim-node', { 'for': 'javascript' } " node support
Plugin 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plugin 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
Plugin 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


nmap <S-Enter> O<Esc>
"f5 in insert mode to save
inoremap <F5> <c-o>:w<cr>

"f2 to show nerdTree
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
let g:molokai_original = 1
set t_Co=256 
set background=dark
"colorscheme solarized 

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif



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
