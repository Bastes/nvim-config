return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
}
