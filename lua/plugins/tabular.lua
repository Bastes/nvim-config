return {
  'godlygeek/tabular',
  config = function()
    -- Raccourcis pour Tabularize
    vim.keymap.set({"n", "v"}, "<Leader>t=", ":Tabularize /=<CR>")
    vim.keymap.set({"n", "v"}, "<Leader>t:", ":Tabularize /:\\zs<CR>")
    vim.keymap.set({"n", "v"}, "<Leader>t|", ":Tabularize /<Bar><CR>")
  end
}
