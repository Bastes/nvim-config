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
    FzfLua.register_ui_select()

    vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = 'find [f]iles' })
    vim.keymap.set('n', '<leader>fb', FzfLua.buffers, { desc = 'find [b]uffers' })
    vim.keymap.set('n', '<leader>fo', FzfLua.oldfiles, { desc = 'find [o]ld files' })
    vim.keymap.set('n', '<leader>fq', FzfLua.quickfix, { desc = 'find [q]uickfix' })
    vim.keymap.set('n', '<leader>fl', FzfLua.lines, { desc = 'find [l]ines in buffers' })
    vim.keymap.set('n', '<leader>fs', FzfLua.treesitter, { desc = 'find [s]ymbols (from treesitter)' })
    vim.keymap.set('n', '<leader>ft', FzfLua.tabs, { desc = 'find [t]abs' })
    vim.keymap.set('n', '<leader>fg', FzfLua.live_grep, { desc = 'find [g]rep' })
    vim.keymap.set('n', '<leader>fr', FzfLua.resume, { desc = 'find [r]esume previous' })

    -- [] shortcuts to navigate the quickfix list
    vim.keymap.set("n", "[f", ":cn<CR>", { silent = true })
    vim.keymap.set("n", "]f", ":cp<CR>", { silent = true })
  end
}
