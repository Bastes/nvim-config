require("elixir").setup({
  nextls = {enable = false},
  elixirls = {
    enable = true,
    -- attaching to lsp-format to auto-format buffers on save
    on_attach = require('lsp-format').on_attach
  },
  projectionist = {enable = true},
  -- giving lsp sources to nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})
