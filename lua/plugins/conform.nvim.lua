return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true})
      end,
      mode = "",
      desc = "Format buffer",
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
    },
    default_format_opts = {
      async = true,
      timeout_ms = 10000
    },
    formatters = {
      standardjs = {
        command = "standard",
        args = { "--fix", "--stdin", "--stdin-filename", "$FILENAME" },
        stdin = true,
        exit_codes = { 0, 1 },
      },
    },
    format_on_save = { async = true }
  },
}
