require('gen').setup({
  model = 'codellama:7b',
  display_mode = 'horizontal-split'
})

vim.keymap.set({ 'n', 'v' }, '<leader>g<leader>', ':Gen<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>ga', ':Gen Ask<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gc', ':Gen Change<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>go', ':Gen Change_Code<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gr', ':Gen Enhance_Grammar_Spelling<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gw', ':Gen Enhance_Wording<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gg', ':Gen Generate<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gs', ':Gen Make_Concise<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gl', ':Gen Make_List<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gt', ':Gen Make_Table<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gb', ':Gen Review_Code<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gq', ':Gen Summarize<CR>')
