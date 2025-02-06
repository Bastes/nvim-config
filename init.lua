-- require("pckr-init")
require("config.lazy")

-- do not conceal quotes in json!
vim.opt.cursorline = true

-- leader-c to toggle conceallevel
vim.keymap.set('n', '<leader>c',
  function()
    if vim.opt.conceallevel:get() == 2 then
      vim.opt.conceallevel = 0
    elseif vim.opt.conceallevel:get() == 0 then
      vim.opt.conceallevel = 2
    end
  end,
  { silent = true, desc = 'Toggle Concealing (conceallevel = 2 / 0)' }
)

-- base line numbers in edit mode, hybrid on command mode
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { pattern = "*", command = "set relativenumber", group = "numbertoggle" }
)
vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { pattern = "*", command = "set norelativenumber", group = "numbertoggle" }
)

-- indent with spaces
vim.opt.expandtab = true

-- display hidden chars
vim.opt.list = true

-- folds using the syntax specifics
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99

-- ignoring a range of documents and directories when listing openables
vim.opt.wildignore = {
  "*.dat",
  "*.exe",
  "*.gitkeep",
  "*.rspec",
  "*.so",
  "*/.git/*",
  "*/.hg/*",
  "*/.svn/*",
  "*/.yardoc/*",
  "*/bin/*",
  "*/coverage/*",
  "*/elm-stuff/*",
  "*/log/*",
  "*/node_modules/*",
  "*/public/uploads/*",
  "*/tmp/*",
  "*/vendor/bundle/*",
}

-- easier split navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")


-- store temporary files somewhere else
local swap_dir = vim.fn.expand('~/.vim/tmp/swap')
vim.opt.dir = swap_dir

if vim.fn.isdirectory(swap_dir) == 0 then
  vim.fn.mkdir(swap_dir, 'p', 0700)
end

-- smartcase search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- :tn => :tabnew
vim.cmd('ca tn tabnew')

-- set the system clipboard as default clipboard to make copy-paste work
-- across nvim and the system's other apps
vim.opt.clipboard = "unnamedplus"

-- adds a color column at 80 to avoir overflowing as much as possible
vim.opt.colorcolumn = "80"
