lua require("pckr-init")

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
