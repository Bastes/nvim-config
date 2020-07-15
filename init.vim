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
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
" - misc
Plug 'danro/rename.vim'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
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
Plug 'roxma/vim-paste-easy'
Plug 'andrewradev/splitjoin.vim'
Plug 'jeetsukumaran/vim-buffergator'

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

" search starts as soon as you start typing
set incsearch

" map / configures haya14busa/incsearch.vim commands
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" indent with spaces
set expandtab

" display hidden chars
set list

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

" Enables elm-format on save
let g:elm_format_autosave = 1

" fzf's search for files
nmap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Only lint on file open/save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'elm': 'elm-format',
\  'ruby': 'rubocop',
\  'javascript': 'eslint',
\}
let g:ale_linters = {
\  'elm': 'elm_ls'
\}
nmap <silent> <C-Up> <Plug>(ale_previous_wrap)
nmap <silent> <C-Down> <Plug>(ale_next_wrap)

" store temporary files somewhere else
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" smartcase search
set ignorecase
set smartcase

" fixing default theme faulty ale warning highlights
highlight ALEWarning ctermbg=Red ctermfg=White

" Rainbow parenthesis
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" SplitJoin config
let splitjoin_ruby_curly_braces = 0 " we don't need all those pesky curly braces when split/joining function hashes
let splitjoin_ruby_hanging_args = 0 " we also don't want to align with the functions' opening parens

" Re-drawing with C-D
nmap <C-D> :redraw!<CR>

" Easytags working asychronously to avoid foreground hanging
let g:easytags_async = 1
