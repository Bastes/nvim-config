return {
  'airblade/vim-gitgutter',
  config = function()
    -- Auto-refresh GitGutter après enregistrement
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*",
      command = "GitGutter"
    })

    -- Raccourcis pour naviguer entre les hunks
    vim.keymap.set("n", "]g", "<Plug>(GitGutterNextHunk)", { desc = "Next Git Hunk" })
    vim.keymap.set("n", "[g", "<Plug>(GitGutterPrevHunk)", { desc = "Previous Git Hunk" })
    vim.keymap.set("n", "<Leader>gp", "<Plug>(GitGutterPreviewHunk)", { desc = "[p]review hunk" })
    vim.keymap.set("n", "<Leader>gs", "<Plug>(GitGutterStageHunk)", { desc = "[s]tage hunk" })
    vim.keymap.set("n", "<Leader>gu", "<Plug>(GitGutterUndoHunk)", { desc = "[u]ndo hunk" })
  end
}
