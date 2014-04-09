set nocompatible
filetype off

" Load Go plugins
set rtp+=$GOROOT/misc/vim

" Load vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Track vundle
Bundle 'gmarik/vundle'

" GUI
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/' }
Bundle 'majutsushi/tagbar'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" Editing
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-sleuth'

" JavaScript
Bundle 'jelera/vim-javascript-syntax'

" Utilities
Bundle 'benmills/vimux'

" Ruby/Rails
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'

" Markdown
Bundle "tpope/vim-markdown"

syntax enable
filetype plugin indent on

set number
set nowrap
set encoding=utf-8
set wildignore +=node_modules,coverage,cache,tmp,vendor,*.png,*.jpg
set noswapfile

" Disable opening message
set shortmess+=I

set ignorecase
set smartcase

set backspace=indent,eol,start
set expandtab
set shiftwidth=2
set softtabstop=2
set smarttab
set smartindent

set foldmethod=syntax
set foldlevel=1
set foldlevelstart=1

set omnifunc=syntaxcomplete#Complete

" Powerline configuration
set laststatus=2
set noshowmode
set guifont=Source\ Code\ Pro\ for\ Powerline

" Stops ESC delay
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set t_Co=256
set background=dark
colorscheme solarized

" For git-gutter realtime
set updatetime=750
let g:gitgutter_realtime = 0

au FileType javascript call JavaScriptFold()

" auto reload .vimrc
augroup myvimrc
  au!
  au BufWritePost .vimrc so $MYVIMRC | if has('gui_running') | so $MYVIMRC | endif
augroup END

nmap <Leader>t :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" Use shared tmux clipboard
set clipboard=unnamed
