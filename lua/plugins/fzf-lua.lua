return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local FzfLua = require('fzf-lua')
    FzfLua.setup({
      files = {
        cmd = [[rg --color=never --hidden --files -g "!**/*.{jpg,png,webp}"]]
      }
    })
    vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = 'find [F]iles' })
    vim.keymap.set('n', '<leader>fb', FzfLua.buffers, { desc = 'find [B]uffers' })
    vim.keymap.set('n', '<leader>fo', FzfLua.oldfiles, { desc = 'find [O]ld files' })
    vim.keymap.set('n', '<leader>fq', FzfLua.quickfix, { desc = 'find [Q]uickfix' })
    vim.keymap.set('n', '<leader>fl', FzfLua.lines, { desc = 'find [L]ines in buffers' })
    vim.keymap.set('n', '<leader>fs', FzfLua.treesitter, { desc = 'find [S]ymbols (from Treesitter)' })
    vim.keymap.set('n', '<leader>ft', FzfLua.tabs, { desc = 'find [T]abs' })
    vim.keymap.set('n', '<leader>fg', FzfLua.grep, { desc = 'find [G]rep' })
    vim.keymap.set('n', '<leader>fr', FzfLua.resume, { desc = 'find [R]esume previous' })

    -- [] shortcuts to navigate the quickfix list
    vim.keymap.set("n", "[f", ":cn<CR>", { silent = true })
    vim.keymap.set("n", "]f", ":cp<CR>", { silent = true })
  end
}
