return {
  'elixir-tools/elixir-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  version = "*",
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local elixir = require('elixir')
    local elixirls = require('elixir.elixirls')

    vim.filetype.add({
      pattern = {
        [ '.*/*.html.lexs' ] = 'elixir',
      }
    })

    elixir.setup {
      nextls = { enable = false },
      elixirls = {
        enable = true,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      },
      projectionist = { enable = true },
      -- on_attach = require('lsp-format').on_attach,
    }
  end
}
