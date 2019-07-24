set nocompatible

" disable arrow keys in escape mode
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>

" disable arrow keys in insert mode
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()

set number
set relativenumber
set softtabstop=4 " Indent by 4444 spaces when hitting tab
set shiftwidth=4 " Indent by 4 spaces when auto-indenting
filetype indent on " Enable indenting for files
set autoindent " Enable auto indenting

" colorscheme related stuff
set termguicolors
syntax on " Enable syntax highlighting
set background=light
colorscheme gruvbox 
let g:airline_theme='gruvbox'

set nobackup " Disable backup files
set wildmenu " Display command line's tab complete options as a menu.

autocmd vimenter * NERDTree
