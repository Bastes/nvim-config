return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup({
      on_attach = require('lsp-format').on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
}
