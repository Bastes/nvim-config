return {
  'SirVer/ultisnips',
  dependencies = { 'honza/vim-snippets' },
  config = function()
    -- Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
    -- - https://github.com/Valloric/YouCompleteMe
    -- - https://github.com/nvim-lua/completion-nvim
    vim.g.UltiSnipsExpandTrigger = "<Tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

    -- If you want :UltiSnipsEdit to split your window.
    vim.g.UltiSnipsEditSplit = "vertical"
  end
}
