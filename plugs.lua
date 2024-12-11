vim.print("begin plugs.lua")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- syntaxes
Plug('dag/vim-fish')
Plug('hughbien/md-vim')
Plug('nono/vim-handlebars')
Plug('tpope/vim-markdown')
Plug('tpope/vim-rails')
Plug('vim-ruby/vim-ruby')
Plug('neovimhaskell/haskell-vim')
Plug('Zaptic/elm-vim')
Plug('andys8/vim-elm-syntax')
Plug('pangloss/vim-javascript')
Plug('wavded/vim-stylus')
Plug('elzr/vim-json')
Plug('leafgarland/typescript-vim')
Plug('luochen1990/rainbow')
Plug('chrisbra/csv.vim')
Plug('hail2u/vim-css3-syntax')

-- searches
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim', { ['depends'] = 'fzf' })
Plug('haya14busa/incsearch.vim')
Plug('unblevable/quick-scope')
Plug('kqito/vim-easy-replace')

-- theme(s)
Plug('morhetz/gruvbox')

-- git integration
Plug('tpope/vim-fugitive')
Plug('tpope/vim-rhubarb')
Plug('junegunn/gv.vim')
Plug('airblade/vim-gitgutter')

-- lsp
Plug('GrzegorzKozub/vim-elixirls', { ['do'] = ':ElixirLsCompileSync' })
Plug('dense-analysis/ale')

-- ctags
Plug('ludovicchabant/vim-gutentags')

-- completion
Plug('Shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })

-- snippets
Plug('SirVer/ultisnips')
Plug('honza/vim-snippets')
Plug('andrewstuart/vim-kubernetes')

-- tables and alignments
Plug('dhruvasagar/vim-table-mode')
Plug('godlygeek/tabular')

-- misc
Plug('danro/rename.vim')
Plug('scrooloose/nerdtree')
Plug('tpope/vim-surround')
Plug('jiangmiao/auto-pairs')
Plug('tpope/vim-endwise')
Plug('tpope/vim-sensible')
Plug('tpope/vim-commentary')
Plug('vim-airline/vim-airline')
Plug('yggdroot/indentline')
Plug('tpope/vim-abolish')
Plug('tpope/vim-repeat')
Plug('tpope/vim-sleuth')
Plug('andrewradev/splitjoin.vim')
Plug('liuchengxu/vim-which-key')
Plug('mhinz/vim-startify')
Plug('ap/vim-css-color')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter-textobjects')
Plug('mbbill/undotree')
Plug('christoomey/vim-system-copy')
Plug('svermeulen/vim-yoink')
Plug('machakann/vim-swap')
Plug('mg979/vim-visual-multi', { ['branch'] = 'master' })

vim.call('plug#end')

vim.print("end plugs.lua")
