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
Plug 'elixir-editors/vim-elixir'
Plug 'chrisbra/csv.vim'
Plug 'hail2u/vim-css3-syntax'
" - searches
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
Plug 'haya14busa/incsearch.vim'
Plug 'unblevable/quick-scope'
Plug 'kqito/vim-easy-replace'
" - theme(s)
Plug 'morhetz/gruvbox'
" - git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
" - lsp
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
Plug 'dense-analysis/ale'
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
" - ctags
Plug 'ludovicchabant/vim-gutentags'
" - completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" - snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'andrewstuart/vim-kubernetes'
" - tables and alignments
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
" - misc
Plug 'danro/rename.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'andrewradev/splitjoin.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-system-copy'
Plug 'svermeulen/vim-yoink'
Plug 'machakann/vim-swap'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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

" :tn => :tabnew
ca tn tabnew

" Load plugin-specific configurations
let config_files_root = expand('~/.config/nvim/plugins/')
let vimscript_config_files_list = [
  \ 'ale',
  \ 'csv',
  \ 'deoplete',
  \ 'vim-elixir',
  \ 'elm-vim',
  \ 'vim-fugitive',
  \ 'fzf',
  \ 'gruvbox',
  \ 'vim-gitgutter',
  \ 'incsearch',
  \ 'rainbow',
  \ 'splitjoin',
  \ 'tabular',
  \ 'ultisnips',
  \ 'undotree',
  \ 'vim-which-key',
  \ 'vim-yoink'
  \ ]

for f in vimscript_config_files_list
  execute 'source ' . config_files_root . f . '.vim'
endfor

let lua_config_files_list = [
  \ 'nvim-treesitter'
  \ ]

for f in lua_config_files_list
  execute 'source ' . config_files_root . f . '.lua'
endfor

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Set textwidth to 80 cols when working with *.md files
au BufRead,BufNewFile *.md setlocal textwidth=80

set colorcolumn=80
