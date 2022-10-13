"================================================================================================
"Quick command in insert mode
"================================================================================================
inoremap AA <Esc>A

"upper case 
imap UU _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>
imap uu _<Esc>mza<C-Right><Esc>bg~iw`zi<Del>

"delete previous word
imap <leader>d _<Esc>vbdi

" copy paste with new lin
:nmap p :pu<CR>

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
"PHP CONFIGUARATION
"================================================================================================
"
"php sintax checking
map <F5> :!php -l %<CR>

" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'
let g:phpfmt_command = '/usr/bin/phpcbf'
let g:phpfmt_tmp_dir = '/tmp/phpcbf_fold'

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

"key map vphpw PHPWRAPER
let g:vphpw_use_default_mapping = 1
let b:vphpw_use_default_mapping = 1

"dont run php auto format on save instead using :PhpFmt
let g:phpfmt_autosave = 0

"auto import use class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>i <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>i :call PhpInsertUse()<CR>


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
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'sainnhe/gruvbox-material' "theme color
Plugin 'folke/tokyonight.nvim' 

"GO Language
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'nvim/'}

"tags
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'

"terminal
Plugin 'gujarats/split-term.vim'

"PHP LANGUAGE
Plugin 'StanAngeloff/php.vim' "sintaks highlighting
Plugin 'joonty/vim-phpqa.git' "Check sintaks error and in phpcs phpms
Plugin 'beanworks/vim-phpfmt' "auto format the coding writings standard
Plugin 'diepm/vim-php-wrapper'
Bundle 'arnaud-lb/vim-php-namespace'

"fancy statusline
Plugin 'vim-airline/vim-airline-themes' " themes for vim-airline
Plugin 'vim-airline/vim-airline' 

" html / templates
"Plugin 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
"Plugin 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
"Plugin 'othree/html5.vim', { 'for': 'html' } " html5 support
"Plugin 'mustache/vim-mustache-handlebars' " mustach support
"Plugin 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } " jade support

" JavaScript
"Plugin 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
"Plugin 'moll/vim-node', { 'for': 'javascript' } " node support
"Plugin 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
"Plugin 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
"Plugin 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support

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
colorscheme tokyonight

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
