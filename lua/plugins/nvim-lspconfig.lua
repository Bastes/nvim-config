return {
  {
    'neovim/nvim-lspconfig',
    name = 'lspconfig',

    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },

    config = function()
      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, {
        noremap = true,
        silent = true,
        desc = "goto [D]eclaration"
      })

      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {
        noremap = true,
        silent = true,
        desc = "goto [d]efinition"
      })

      vim.keymap.set({ "n", "v" }, "<leader>lA", vim.lsp.buf.code_action, {
        noremap = true,
        silent = true,
        desc = "code [A]ction"
      })

      vim.keymap.set("n", "<leader>la", function()
        vim.lsp.buf.code_action({
          filter = function(action)
            return action.kind == "quickfix"
          end,
          apply = true,
        })
      end, {
        noremap = true,
        silent = true,
        desc = "quick fix (code [a]ction)"
      })

      vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, {
        noremap = true,
        silent = true,
        desc = "[e]rror diagnostic"
      })

      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {
        noremap = true,
        silent = true,
        desc = "[h]over"
      })

      vim.keymap.set("n", "<leader>li", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, {
        noremap = true,
        silent = true,
        desc = "toggle [i]nlay hints",
      })

      vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, {
        noremap = true,
        silent = true,
        desc = "document [s]ymbol"
      })

      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {
        noremap = true,
        silent = true,
        desc = "find [r]eferences"
      })

      vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, {
        noremap = true,
        silent = true,
        desc = "[R]ename symbol"
      })

      vim.lsp.config("ruby_lsp", {
        init_options = {
          linters = { 'standard' },
        },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      vim.lsp.enable("ruby_lsp")

      vim.lsp.config("gopls", {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })
      vim.lsp.enable("gopls")

      vim.lsp.enable("lua_ls")
    end,
  },
}
