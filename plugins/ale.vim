" Only lint on file open/save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'elm': 'elm-format',
\  'ruby': 'rubocop',
\  'javascript': 'eslint',
\}
let g:ale_linters = {
\  'elm': 'elm_ls'
\}
nmap <silent> <C-Up> <Plug>(ale_previous_wrap)
nmap <silent> <C-Down> <Plug>(ale_next_wrap)

" fixing default theme faulty ale warning highlights
highlight ALEWarning ctermbg=Red ctermfg=White
