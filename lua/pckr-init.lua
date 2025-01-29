local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  -- AI
   'David-Kunz/gen.nvim',
  -- syntaxes
  'dag/vim-fish';
  'hughbien/md-vim';
  'nono/vim-handlebars';
  'tpope/vim-markdown';
  'tpope/vim-rails';
  'neovimhaskell/haskell-vim';
  'Zaptic/elm-vim';
  'andys8/vim-elm-syntax';
  'pangloss/vim-javascript';
  'wavded/vim-stylus';
  'elzr/vim-json';
  'chrisbra/csv.vim';
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
  'nvim-treesitter/nvim-treesitter-textobjects';
  { 'yioneko/nvim-yati', requires = { 'nvim-treesitter/nvim-treesitter' } };
  -- searches
  { 'junegunn/fzf.vim', requires = { 'junegunn/fzf' } };
  'haya14busa/incsearch.vim';
  'unblevable/quick-scope';
  'kqito/vim-easy-replace';
  -- theme(s)
  'morhetz/gruvbox';
  -- git integration
  'tpope/vim-fugitive';
  'tpope/vim-rhubarb';
  'junegunn/gv.vim';
  'airblade/vim-gitgutter';
  -- lsp
  { 'GrzegorzKozub/vim-elixirls', run = function()
    vim.cmd('cd vim-elixirls')
    vim.fn.system('git submodule update --init')
    vim.cmd('cd ..')
    vim.cmd('ElixirLsCompileSync')
  end};
  { 'elixir-tools/elixir-tools.nvim', tag = 'stable', requires = { 'nvim-lua/plenary.nvim' }};
  { 'pmizio/typescript-tools.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require("typescript-tools").setup {}
    end
  };
  { 'lukas-reineke/lsp-format.nvim',
    requires = { 'neovim/nvim-lspconfig' },
    config = function()
      require('lsp-format').setup({})
    end
  };
  -- ctags
  'ludovicchabant/vim-gutentags';
  -- completion
  { 'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig';
      'hrsh7th/cmp-nvim-lsp';
      'hrsh7th/cmp-buffer';
      'hrsh7th/cmp-path';
      'hrsh7th/cmp-cmdline';
      'quangnguyen30192/cmp-nvim-ultisnips';
    }
  };
  -- snippets
  'SirVer/ultisnips';
  'honza/vim-snippets';
  'andrewstuart/vim-kubernetes';
  -- tables and alignments
  'dhruvasagar/vim-table-mode';
  'godlygeek/tabular';
  -- misc
  'danro/rename.vim';
  'scrooloose/nerdtree';
  'tpope/vim-surround';
  'jiangmiao/auto-pairs';
  'tpope/vim-endwise';
  'tpope/vim-sensible';
  'tpope/vim-commentary';
  'vim-airline/vim-airline';
  'yggdroot/indentline';
  'tpope/vim-abolish';
  'tpope/vim-repeat';
  'tpope/vim-sleuth';
  'andrewradev/splitjoin.vim';
  'liuchengxu/vim-which-key';
  'mhinz/vim-startify';
  'ap/vim-css-color';
  'mbbill/undotree';
  'christoomey/vim-system-copy';
  'svermeulen/vim-yoink';
  'machakann/vim-swap';
  { 'mg979/vim-visual-multi', branch = 'master' };
}
