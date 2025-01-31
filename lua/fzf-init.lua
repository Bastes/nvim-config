vim.keymap.set('n', '<leader>o', ':FZF<CR>')

vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git'"

-- [] shortcuts to navigate the quickfix list
vim.keymap.set("n", "[f", ":cn<CR>", { silent = true })
vim.keymap.set("n", "]f", ":cp<CR>", { silent = true })
