return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        vim.lsp.buf.format({ async = true})
      end,
      mode = "",
      desc = "Format Buffer",
    }
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      elixir = { "mix" },
      javascript = { "standardjs" },
      ruby = { "rubocop" },
      eruby = { "erb_format" },
    },
    default_format_opts = {
      async = true
    },
    formatters = {
      standardjs = {
        command = "standard",
        args = { "--fix", "--stdin", "--stdin-filename", "$FILENAME" },
        stdin = true,
        exit_codes = { 0, 1 },
      },
    },
    format_after_save = { async = true }
  },
  config = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end
}
