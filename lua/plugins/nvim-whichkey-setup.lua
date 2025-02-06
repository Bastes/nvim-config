return {
  'AckslD/nvim-whichkey-setup.lua',
  dependencies = { 'liuchengxu/vim-which-key' },
  config = function()
    -- since space is my leader key, add WhichKey to the binding
    vim.keymap.set("n", "<leader>", ":WhichKey '<Space>'<CR>", { silent = true })

    -- snappier timeout
    vim.opt.timeoutlen = 500

    local wk = require('whichkey_setup')

    local keymap = {
        h = {
            name = 'Git',
            s = 'Stage Hunk',
            u = 'Undo Hunk',
            p = 'Preview Hunk',
        },
        l = {
            name = 'LSP',
            d = 'go to definition',
            D = 'go to Declaration',
            f = 'format document',
            h = 'show informations',
            r = 'find references',
            R = 'Rename',
            s = 'list document symbols',
        },
        o = 'Open File',
        p = 'Paste after (without auto-format)',
        P = 'Paste before (without auto-format)',
        r = {
            name = 'EasyReplace',
            a = 'Replace',
            c = 'Replace Current Word',
        },
        y = {
            name = 'Yoink!',
            p = 'Previous Yanked',
            n = 'Next Yanked',
        },
        t = { name = 'Tabular / Table Mode' },
    }

    wk.register_keymap('leader', keymap)
  end
};
