-- search starts as soon as you start typing
vim.opt.incsearch = true

-- highlight search results
vim.opt.hlsearch = true

-- automatically deactivates highlight after searching
vim.g["incsearch#auto_nohlsearch"] = 1

-- remapping to use incsearch for searching and navigating through searches
vim.keymap.set("n", "/",  "<Plug>(incsearch-forward)")
vim.keymap.set("n", "?",  "<Plug>(incsearch-backward)")
vim.keymap.set("n", "g/", "<Plug>(incsearch-stay)")
vim.keymap.set("n", "n",  "<Plug>(incsearch-nohl-n)")
vim.keymap.set("n", "N",  "<Plug>(incsearch-nohl-N)")
vim.keymap.set("n", "*",  "<Plug>(incsearch-nohl-*)")
vim.keymap.set("n", "#",  "<Plug>(incsearch-nohl-#)")
vim.keymap.set("n", "g*", "<Plug>(incsearch-nohl-g*)")
vim.keymap.set("n", "g#", "<Plug>(incsearch-nohl-g#)")

