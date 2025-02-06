return {
  'tpope/vim-fugitive',
  config = function()
    vim.o.diffopt = vim.o.diffopt .. ',vertical'
  end
}
