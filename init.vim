" Alex Langford <nirvashtzero@gmail.com>

" Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

" Nice defaults
filetype on
filetype indent on
filetype plugin on
syntax on
syntax sync fromstart
set encoding=utf-8
set number
set showcmd
set ruler
set backspace=2
let mapleader=","

" Formatting settings
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set textwidth=80
set linebreak
autocmd Filetype c,cpp,objc nnoremap <buffer><Leader>f :ClangFormat<cr>
autocmd Filetype c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
autocmd Filetype rust nnoremap <buffer><Leader>f :RustFmt<cr>

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase

" Color settings
set t_Co=256
colorscheme onehalfdark
set background=dark
set termguicolors

" vim-airline settings
set laststatus=2
let g:airline_theme="onehalfdark"
