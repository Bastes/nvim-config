require('typescript-tools').setup({
  -- attaching to lsp-format to auto-format buffers on save
  on_attach = require('lsp-format').on_attach,
  -- giving lsp sources to nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})
