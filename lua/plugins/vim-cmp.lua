return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'petertriho/cmp-git',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local cmp = require('cmp')
    local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
      }),
      sources = cmp.config.sources({
        -- TODO: activate with lsp support
        -- { name = 'nvim_lsp' },
        { name = 'ultisnips' },
      }, {
        { name = 'buffer' },
      })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })
    require("cmp_git").setup()

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Set up lspconfig.
    -- TODO: activate with lsp support
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  end
}

