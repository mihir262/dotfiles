" ---------- PLUGINS ----------
" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" LSP & Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'preservim/nerdtree'

" Commenting
Plug 'tpope/vim-commentary'

" Git integration
Plug 'tpope/vim-fugitive'

" Status line - removed for minimal setup
" Plug 'vim-airline/vim-airline'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Color schemes - removed for minimal setup
" Plug 'folke/tokyonight.nvim'
" Plug 'joshdick/onedark.vim'
" Plug 'bluz71/vim-nightfly-colors'

call plug#end()

" ---------- BASIC ----------
set nocompatible
syntax on
filetype plugin indent on

" Color scheme
set termguicolors
set background=dark

set number
set relativenumber
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set wrap
set scrolloff=8
set sidescrolloff=8

set ignorecase
set smartcase
set incsearch
set hlsearch

set mouse=a

set clipboard=unnamedplus

set splitbelow
set splitright

set undofile
set undodir=~/.vim/undo

" Better completion
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set updatetime=300
set signcolumn=yes

" Show commands
set showcmd
set wildmenu
set wildmode=longest:full,full

" ---------- LEADER ----------
let mapleader=" "

" ---------- QUICK COMMANDS ----------
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" ---------- FAST MOVEMENT ----------
nnoremap J 5j
nnoremap K 5k

" ---------- PLUGIN MAPPINGS ----------
" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>

" ---------- COC AUTOCOMPLETION ----------
" Use Tab for trigger completion and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" ---------- CLEAN WHITESPACE ----------
autocmd BufWritePre * %s/\s\+$//e

" ---------- STATUSLINE ----------
set laststatus=2
set statusline=%f\ %m%=%l:%c\ %p%%
highlight StatusLine ctermbg=black ctermfg=white guibg=#000000 guifg=#ffffff
highlight StatusLineNC ctermbg=black ctermfg=darkgray guibg=#000000 guifg=#666666

" ---------- LSP COLORS ----------
" Fix CoC LSP highlighting colors
highlight CocFloating guibg=#1e1e1e guifg=#d4d4d4
highlight CocMenuSel guibg=#094771 guifg=#ffffff
highlight CocSearch guifg=#00ff00
highlight CocErrorFloat guifg=#ff6b6b
highlight CocWarningFloat guifg=#ffcc66
highlight CocInfoFloat guifg=#61afef
highlight CocHintFloat guifg=#98c379

" Diagnostic signs
highlight CocErrorSign guifg=#ff6b6b
highlight CocWarningSign guifg=#ffcc66
highlight CocInfoSign guifg=#61afef
highlight CocHintSign guifg=#98c379

" Diagnostic virtual text/underlines
highlight CocErrorHighlight gui=undercurl guisp=#ff6b6b
highlight CocWarningHighlight gui=undercurl guisp=#ffcc66
highlight CocInfoHighlight gui=undercurl guisp=#61afef
highlight CocHintHighlight gui=undercurl guisp=#98c379

" Symbol highlighting
highlight CocHighlightText guibg=#3e4451

" Inlay hints
highlight CocInlayHint guifg=#5c6370 guibg=#2c313c
