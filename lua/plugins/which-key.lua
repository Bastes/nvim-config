return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-mini/mini.nvim"
  },
  event = "VeryLazy",
  init = function()
    -- snappier timeout
    vim.opt.timeoutlen = 500
  end,
  opts = {
    -- you can add global which-key settings here if needed
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({"<leader>c", group = "CodeCompanion"})
    wk.add({"<leader>f", group = "Find (FzfLua)"})
    wk.add({"<leader>h", group = "Git"})
    wk.add({"<leader>l", group = "LSP"})
    wk.add({"<leader>n", group = "NeovimTree"})
    wk.add({"<leader>s", group = "Spectre"})
    wk.add({"<leader>t", group = "Tables"})
  end,
}
