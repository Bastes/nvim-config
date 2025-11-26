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

    wk.add({"<leader>c", group = "[c]odeCompanion"})
    wk.add({"<leader>f", group = "[f]ind (FzfLua)"})
    wk.add({"<leader>g", group = "[g]it"})
    wk.add({"<leader>l", group = "[l]sp"})
    wk.add({"<leader>s", group = "[s]pectre"})
    wk.add({"<leader>t", group = "[t]ables"})
  end,
}
