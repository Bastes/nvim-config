" since space is my leader key, add WhichKey to the binding
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" snappier timeout
set timeoutlen=500

let g:which_key_map = {}
let g:which_key_map.a = {'name' : 'Ale'}

let g:which_key_map.h = {
  \ 'name' : 'Git',
  \ 's' : 'Stage Hunk',
  \ 'u' : 'Undo Hunk',
  \ 'p' : 'Preview Hunk',
  \}

let g:which_key_map.p = 'Paste after (without auto-format)'
let g:which_key_map.P = 'Paste before (without auto-format)'

let g:which_key_map.r = {
  \ 'name' : 'EasyReplace',
  \ 'a' : 'Replace',
  \ 'c' : 'Replace Current Word',
  \ }

let g:which_key_map.t = {'name' : 'Tabular / Table Mode'}

call which_key#register('<Space>', 'g:which_key_map')
