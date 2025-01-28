-- Press `[g` / `]g` to go to previous/next diagnostic issue
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
