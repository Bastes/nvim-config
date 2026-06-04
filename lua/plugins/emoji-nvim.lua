return {
  "allaman/emoji.nvim",
  ft = "*",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
  },
  opts = {
    enable_cmp_integration = true,
  },
  config = function(_, opts)
    local emoji = require("emoji")
    emoji.setup(opts)
    vim.keymap.set('n', '<leader>se', emoji.insert, { desc = 'search [e]moji' })
  end,
}
