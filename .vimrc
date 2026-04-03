" ---------- PLUGINS ----------
" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Git integration
Plug 'tpope/vim-fugitive'

call plug#end()

" ---------- BASIC ----------
set nocompatible
syntax on
filetype plugin indent on

set background=dark

set number
set relativenumber
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set scrolloff=8

set ignorecase
set smartcase
set incsearch
set hlsearch

set mouse=a

set clipboard=unnamedplus

set splitbelow
set splitright

" Show commands
set showcmd
set wildmenu

" ---------- LEADER ----------
let mapleader=" "

" ---------- MAPPINGS ----------
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>

" ---------- STATUSLINE ----------
set laststatus=2
set statusline=%f\ %m%=%l:%c\ %p%%
