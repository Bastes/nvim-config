return {
  "David-Kunz/gen.nvim",
  opts = {
    model = 'mistral:7b',
    display_mode = 'horizontal-split'
  },
  config = function()
    require('gen').prompts['Fix_Code'] = {
      prompt = "Fix the following code.\nOnly output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    require('gen').prompts['Fix_Code_Problem'] = {
      prompt = "Fix the following code.\nThe problem is $input.\nOnly output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>g<leader>', ':Gen<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>ga', ':Gen Ask<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gc', ':Gen Change<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>go', ':Gen Change_Code<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gr', ':Gen Enhance_Grammar_Spelling<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gw', ':Gen Enhance_Wording<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gf', ':Gen Fix_Code<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gp', ':Gen Fix_Code_Problem<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gg', ':Gen Generate<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gs', ':Gen Make_Concise<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gl', ':Gen Make_List<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gt', ':Gen Make_Table<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gb', ':Gen Review_Code<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>gq', ':Gen Summarize<CR>')
  end
}
