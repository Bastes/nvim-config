return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})

    -- Add keybinding to toggle nvim-tree
    vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { silent = true })
  end,
}
