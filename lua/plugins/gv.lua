return {
  'junegunn/gv.vim',
  keys = {
    { '<leader>gH',  '<cmd>GV<cr>',  desc = 'Git [H]istory view' },
    { '<leader>ghf', '<cmd>GV!<cr>', desc = '[f]ile-specific history view' },
    { '<leader>ghl', '<cmd>GV?<cr>', desc = 'Fill location [l]ist with revisions' },
  }
}
