-- Auto-refresh GitGutter après enregistrement
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  command = "GitGutter"
})

-- Raccourcis pour naviguer entre les hunks
vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)")
vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)")
vim.keymap.set("n", "<Leader>hp", "<Plug>(GitGutterPreviewHunk)")
