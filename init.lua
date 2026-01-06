-- disable netrw at the very start of your init.lua (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")

-- do not conceal quotes in json!
vim.opt.cursorline = true

-- leader-c to toggle conceallevel
vim.keymap.set('n', '<leader>clt',
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

-- spelling in english and french
vim.opt_local.spell = true
vim.opt.spelllang = { "en_gb", "fr" }

-- let's disable ex mode, it's a silly place
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })

-- nohlsearch on move preserves my tired eyes from all that highlighting
vim.on_key(function(key)
  local mode = vim.api.nvim_get_mode().mode
  if mode == "n" and vim.v.hlsearch == 1 then
    if key == "\27" or key:match("[hjklwbe%(%)]") then
      vim.cmd("nohlsearch")
    end
  end
end, vim.api.nvim_create_namespace("auto_nohl"))
