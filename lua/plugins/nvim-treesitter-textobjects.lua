-- TODO: check whether to config manually (i.e. to treat functions as paragraphs)
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  init = function()
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        -- You can choose the select mode (default is charwise 'v')
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },

        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in `ap`.
        include_surrounding_whitespace = true,
      },
      move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
      },
    }

    local select = require 'nvim-treesitter-textobjects.select'
    local move = require 'nvim-treesitter-textobjects.move'

    vim.keymap.set({ 'x', 'o' }, 'af', function()
      select.select_textobject('@function.outer', 'textobjects')
    end, { desc = 'Select outer part of a function region' })
    vim.keymap.set({ 'x', 'o' }, 'if', function()
      select.select_textobject('@function.inner', 'textobjects')
    end, { desc = 'Select inner part of a function region' })

    vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
      move.goto_next_start('@function.outer', 'textobjects')
    end, { desc = 'Next function start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
      move.goto_next_start('@block.outer', 'textobjects')
    end, { desc = 'Next block start' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']o', function()
      move.goto_next_start('@loop.*', 'textobjects')
    end, { desc = 'Next loop start' })

    vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
      move.goto_next_end('@function.outer', 'textobjects')
    end, { desc = 'Next function end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
      move.goto_next_end('@block.outer', 'textobjects')
    end, { desc = 'Next block end' })

    vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
      move.goto_previous_start('@function.outer', 'textobjects')
    end, { desc = 'Previous function start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
      move.goto_previous_start('@block.outer', 'textobjects')
    end, { desc = 'Previous block start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[o', function()
      move.goto_previous_start('@loop.*', 'textobjects')
    end, { desc = 'Previous loop start' })

    vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
      move.goto_previous_end('@function.outer', 'textobjects')
    end, { desc = 'Previous function end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
      move.goto_previous_end('@block.outer', 'textobjects')
    end, { desc = 'Previous block end' })

    vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
      move.goto_next('@conditional.outer', 'textobjects')
    end, { desc = 'Next conditional limit' })
    vim.keymap.set({ 'n', 'x', 'o' }, ']s', function()
      move.goto_next('@local.scope', 'locals')
    end, { desc = 'Next scope' })

    vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
      move.goto_previous('@conditional.outer', 'textobjects')
    end, { desc = 'Previous conditional limit' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[s', function()
      move.goto_previous('@local.scope', 'locals')
    end, { desc = 'Previous scope' })
  end
}
