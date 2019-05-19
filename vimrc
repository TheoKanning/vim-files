" Theo's Global Defaults

" Bundle Plugins!
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:goldenview__enable_default_mapping = 0

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Vundle stuff
" Ctrl-P, Ctrl-O
Bundle 'kien/ctrlp.vim'
",nt ,nf
Bundle 'scrooloose/nerdtree'
" Bundle 'tpope/vim-fugitive'
" Bundle 'gregsexton/gitv'
" Bundle 'mileszs/ack.vim'
" Bundle 'tpope/vim-abolish.git'
" Bundle 'tpope/vim-dispatch'
" Bundle 'radenling/vim-dispatch-neovim'
" Bundle 'scrooloose/nerdcommenter.git'
" Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-unimpaired.git'
" Bundle 'vim-scripts/Align.git'
" Bundle 'elzr/vim-json'
" Plugin 'editorconfig/editorconfig-vim'

" Todo Update to new Base16 theme
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Java Imports
"Bundle 'sjurgemeyer/vimport'

" After updating this list, run `nvim +BundleInstall +qall`
" After updating this list, run `nvim +PluginInstall +qall`

" tagbar support for groovy
 let g:tagbar_type_groovy = {
 \ 'ctagstype' : 'groovy',
 \ 'kinds' : [
     \ 'p:package',
     \ 'c:class',
     \ 'i:interface',
     \ 'f:function',
     \ 'v:variables',
     \ ]
 \ }


filetype plugin indent on

" I like pretty colors
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Ctrl-P ignore path
set wildignore+=*.class,.git,.hg,.svn,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.html,**/target/test-reports/**.xml,**/build/**
let g:ctrlp_cmd = 'CtrlPTag'
nnoremap <C-i> :<C-U>CtrlP <CR>

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
"set ignorecase smartcase    " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Set the current line with the cursor on it to have an underline
set cursorline
set cmdheight=2
" When switching buffers, swap for the current open window
"set switchbuf=useopen
"
" Turn on line numbers
set number
set numberwidth=5

" Always show cursor information
set ruler

"set errorformat=%A""%f: %l"" : %m,%+G%.%#
set errorformat=%A""%f: %l"" : %m,%+%.%#

" The number of lines before and after the cursor to show
set scrolloff=3

let mapleader=","

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Search highlighting
set hlsearch
function! MapCr()
    nnoremap \ :nohlsearch<CR>
endfunction
call MapCr()

" my settings
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set background=dark

colorscheme Tomorrow-Night

" Vertical Column Limiter
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%121v.\+/
set colorcolumn=121
highlight ColorColumn ctermbg=2

" NerdTree
let g:NERDTreeWinSize = 40
noremap <Leader>nt :<C-U>NERDTreeToggle<CR>
noremap <Leader>nf :<C-U>NERDTreeFind<CR>

" Really not a big fan of trailing whitespace, mark it red
set list listchars=tab:>-,trail:·,precedes:<,extends:>

