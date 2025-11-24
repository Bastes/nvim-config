return {
  'godlygeek/tabular',
  config = function()
    -- Raccourcis pour Tabularize
    vim.keymap.set({"n", "v"}, "<Leader>t=", ":Tabularize /=<CR>", { desc = "tabularize on [=]" })
    vim.keymap.set({"n", "v"}, "<Leader>t:", ":Tabularize /:\\zs<CR>", { desc = "tabularize on [:]" })
    vim.keymap.set({"n", "v"}, "<Leader>t|", ":Tabularize /<Bar><CR>", { desc = "tabularize on [|]" })
  end
}
