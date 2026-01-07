-- TODO: check whether to config manually (i.e. to treat functions as paragraphs)
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  requires = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require("nvim-treesitter.configs").setup {
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true or false
          include_surrounding_whitespace = true,
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]]"] = { query = "@block.outer", desc = "Next block start" },
            ["]o"] = { query = "@loop.*", desc = "Next loop start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]["] = { query = "@block.outer", desc = "Next block end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[["] = { query = "@block.outer", desc = "Previous block start" },
            ["[o"] = { query = "@loop.*", desc = "Previous loop start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[]"] = { query = "@block.outer", desc = "Previous block end" },
          },
          goto_next = {
            ["]c"] = { query = "@conditional.outer", desc = "Next conditional limit" },
            ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
          },
          goto_previous = {
            ["[c"] = { query = "@conditional.outer", desc = "Previous conditional limit" },
            ["[s"] = { query = "@local.scope", query_group = "locals", desc = "Previous scope" },
          }
        },
      },
    }
  end
}
