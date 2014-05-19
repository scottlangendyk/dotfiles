set nocompatible
filetype off

" Load Go plugins
set rtp+=$GOROOT/misc/vim

" Load vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Track vundle
Plugin 'gmarik/Vundle.vim'

" GUI
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'

" Utilities
Plugin 'benmills/vimux'

" Markdown
Plugin 'tpope/vim-markdown'

syntax enable
call vundle#end()
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
let g:airline_powerline_fonts = 1

" Stops ESC delay
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set t_Co=16
set background=dark
colorscheme solarized

" For git-gutter realtime
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

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

" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999

" Show hidden files in nerd tree
let NERDTreeShowHidden=1

" Set filetype for ruby config files
au BufNewFile,BufRead Berksfile,Cheffile,Vagrantfile set filetype=ruby
