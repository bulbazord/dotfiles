" Alex Langford <nirvashtzero@gmail.com>
" Inspired by Saleem Abdulrasool <compnerd@compnerd.org>

set nocompatible
filetype off

" Vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vim enhancement plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rhysd/vim-clang-format'

Bundle 'sonph/onehalf', {'rtp': 'vim/'}

call vundle#end()

" Filetypes
filetype on
filetype indent on
filetype plugin on

" Nice defaults
syntax on
syntax sync fromstart
set encoding=utf-8
set number
set showcmd
set ruler
set backspace=2

" Leader key
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

" Copy and paste to/from system clipboard
nnoremap <Leader>Y "*Y
vnoremap <Leader>y "*y
nnoremap <Leader>P "*P
vnoremap <Leader>p "*p

" Clang formatting
autocmd Filetype c,cpp,objc nnoremap <buffer><Leader>f :ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase

" Colorscheme
set t_Co=256
colorscheme onehalfdark
set background=dark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Airline stuff
set laststatus=2
let g:airline_theme="onehalfdark"
