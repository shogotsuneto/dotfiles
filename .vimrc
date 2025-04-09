"------------------------------------------------------------
" Colorscheme and Highlight Settings
"------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
set nocompatible
" syntax on

filetype plugin on
runtime macros/matchit.vim

"colorscheme desert
hi Normal ctermbg=NONE
hi Pmenu ctermbg=5
"hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=5

" plug-ins

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-commentary'
"call plug#end()
" PlugInstall

"-----------------------------------------------------------
" Common Settings
"------------------------------------------------------------
set history=200

set laststatus=2
set statusline=%f%=%l/%L
set cursorline
set guicursor=
set hlsearch
set cursorcolumn
set wildmenu wildmode=list:longest
set clipboard=unnamed
set number
set ruler
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan
set incsearch
set ignorecase
set smartcase
set backspace=2
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

"------------------------------------------------------------
" Common Settings (key maps)
"------------------------------------------------------------
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
noremap <Up> <C-w>k
noremap <Down> <C-w>j
noremap <Left> <C-w>h
noremap <Right> <C-w>l

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

cnoremap %% %:h

if (exists('+colorcolumn'))
    set colorcolumn=80
    hi ColorColumn ctermbg=167
endif
