return {
  'svermeulen/vim-yoink',
  config = function()
    -- Raccourcis pour Yoink
    vim.keymap.set("n", "<Leader>yp", "<Plug>(YoinkPostPasteSwapBack)")
    vim.keymap.set("n", "<Leader>yn", "<Plug>(YoinkPostPasteSwapForward)")

    vim.keymap.set("n", "p", "<Plug>(YoinkPaste_p)")
    vim.keymap.set("n", "P", "<Plug>(YoinkPaste_P)")

    -- Remplacer gp par Yoink paste pour pouvoir basculer entre les deux
    vim.keymap.set("n", "gp", "<Plug>(YoinkPaste_gp)")
    vim.keymap.set("n", "gP", "<Plug>(YoinkPaste_gP)")
  end
}
