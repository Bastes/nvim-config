if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Add or remove your Bundles here:
" - syntaxes
Plug 'dag/vim-fish'
Plug 'hughbien/md-vim'
Plug 'nono/vim-handlebars'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'neovimhaskell/haskell-vim'
Plug 'Zaptic/elm-vim'
Plug 'andys8/vim-elm-syntax'
Plug 'pangloss/vim-javascript'
Plug 'wavded/vim-stylus'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'luochen1990/rainbow'
" - searches
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
Plug 'haya14busa/incsearch.vim'
" - theme(s)
Plug 'morhetz/gruvbox'
" - misc
Plug 'danro/rename.vim'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'andrewradev/splitjoin.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'liuchengxu/vim-which-key'

call plug#end()


filetype plugin indent on
syntax enable

" do not conceal quotes in json!
set conceallevel=0

" base line numbers in edit mode, hybrid on command mode
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" indent with spaces
set expandtab

" display hidden chars
set list

" space makes for a better leader key
let mapleader = " "

" folds using the syntax specifics
set foldmethod=syntax
set foldlevelstart=99

set wildignore=*/tmp/*,*/log/*,*/bin/*,*/.yardoc/*,*/coverage/*,*/vendor/bundle/*,*.rspec,*/public/uploads/*
set wildignore+=*/node_modules/*,*/elm-stuff/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.gitkeep
set wildignore+=*.exe,*.so,*.dat

" who needs Ex mode anyways?
nnoremap Q <nop>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" store temporary files somewhere else
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" smartcase search
set ignorecase
set smartcase

" Re-drawing with C-D
nmap <C-D> :redraw!<CR>

" Load plugin-specific configurations
let config_files_root = expand('~/.config/nvim/plugins/')
let config_files_list = [
  \ 'ale',
  \ 'elm-vim',
  \ 'fzf',
  \ 'gruvbox',
  \ 'vim-gitgutter',
  \ 'incsearch',
  \ 'rainbow',
  \ 'splitjoin',
  \ 'vim-which-key',
  \ ]

for f in config_files_list
  execute 'source ' . config_files_root . f . '.vim'
endfor
