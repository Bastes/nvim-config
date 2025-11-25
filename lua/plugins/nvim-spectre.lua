return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  keys = {
    {
      "<leader>S",
      function()
        require("spectre").toggle()
      end,
      mode = "n",
      desc = "Toggle Spectre",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      mode = "n",
      desc = "search current [w]ord",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual()
      end,
      mode = "v",
      desc = "search current [w]ord",
    },
    {
      "<leader>sf",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      mode = "n",
      desc = "search on current [f]ile",
    },
  },
}
