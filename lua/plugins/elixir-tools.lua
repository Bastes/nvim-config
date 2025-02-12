return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    vim.filetype.add({
      pattern = {
        [ '.*/*.html.lexs' ] = 'elixir',
      }
    })

    elixir.setup {
      nextls = { enable = true },
      elixirls = { enable = false },
      projectionist = { enable = true }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
