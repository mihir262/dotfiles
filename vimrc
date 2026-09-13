" general settings

set nocompatible
syntax on
set number
set relativenumber
set nowrap
set autoindent
set smartindent
set noswapfile
set formatoptions+=r

set tabstop=4
set shiftwidth=4
set expandtab

" Codeforces
let g:cf_template = expand('~/.vim/templates/cf.cpp')

function! s:LoadCFTemplate() abort
  if !filereadable(g:cf_template)
    echoerr 'Missing template: ' . g:cf_template
    return
  endif
  execute '0r ' . fnameescape(g:cf_template)
  if getline('$') ==# ''
    $delete _
  endif
  call search('while(t--)', 'w')
  normal! j
  startinsert!
endfunction

command! CF call s:LoadCFTemplate()

" MacVim
if has("gui_running")
    set guifont=JetBrains\ Mono:h24
    au GUIEnter * winpos 0 0
    au GUIEnter * set lines=999 columns=999
endif

