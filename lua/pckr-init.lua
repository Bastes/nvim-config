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
  'vim-ruby/vim-ruby';
  'neovimhaskell/haskell-vim';
  'Zaptic/elm-vim';
  'andys8/vim-elm-syntax';
  'pangloss/vim-javascript';
  'wavded/vim-stylus';
  'elzr/vim-json';
  'leafgarland/typescript-vim';
  'luochen1990/rainbow';
  'chrisbra/csv.vim';
  'hail2u/vim-css3-syntax';
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
  'dense-analysis/ale';
  -- ctags
  'ludovicchabant/vim-gutentags';
  -- completion
  { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' };
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
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
  'nvim-treesitter/nvim-treesitter-textobjects';
  { 'yioneko/nvim-yati', requires = { 'nvim-treesitter/nvim-treesitter' } };
  'mbbill/undotree';
  'christoomey/vim-system-copy';
  'svermeulen/vim-yoink';
  'machakann/vim-swap';
  { 'mg979/vim-visual-multi', branch = 'master' };
}
