return {
  'airblade/vim-gitgutter',
  config = function()
    -- Auto-refresh GitGutter après enregistrement
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*",
      command = "GitGutter"
    })

    -- Raccourcis pour naviguer entre les hunks
    vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)", { desc = "Next Git Hunk" })
    vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)", { desc = "Previous Git Hunk" })
    vim.keymap.set("n", "<Leader>hp", "<Plug>(GitGutterPreviewHunk)", { desc = "Preview Hunk" })
    vim.keymap.set("n", "<Leader>hs", "<Plug>(GitGutterStageHunk)", { desc = "Stage Hunk" })
    vim.keymap.set("n", "<Leader>hu", "<Plug>(GitGutterUndoHunk)", { desc = "Undo Hunk" })
  end
}
