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
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "file [e]xplorer toggle" })
  end,
}
