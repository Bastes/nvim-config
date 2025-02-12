return {
  {
    'neovim/nvim-lspconfig',
    name = 'lspconfig',

    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },

    config = function()
      vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
      vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { noremap = true, silent = true })

      vim.opt.signcolumn = "yes"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.lsp.start {
            name = "rubocop",
            cmd = { "bundle", "exec", "rubocop", "--lsp" }
          }
        end
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rb",
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      local lspconfig = require('lspconfig')
      lspconfig.ruby_lsp.setup({
        init_options = {
          formatter = 'standard',
          linters = { 'standard' },
        },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,
  },
}
