require("elixir").setup({
  nextls = {enable = false},
  elixirls = {
    enable = true,
    -- see lsp-format for details
    on_attach = require('lsp-format').on_attach
  },
  projectionist = {enable = true},
})
