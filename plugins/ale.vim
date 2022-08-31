" Automatic completion
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 0

" Include the linter name, code and message in errors
let g:ale_echo_msg_format = '[%linter%]% [code]% %s'

" Only lint on file open/save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\  'elm': 'elm-format',
\  'ruby': 'rubocop',
\  'javascript': 'eslint',
\  'elixir': 'mix_format'
\}

let g:ale_linters = {
\  'elm': 'elm_ls',
\  'elixir': ['elixir-ls']
\}

" Disabling dialyzer (too slow, more readable along with the tests)
let g:ale_elixir_elixir_ls_config = {
\  'elixirLS': { 'dialyzerEnabled': v:false }
\}

let g:ale_elixir_elixir_ls_release = expand("~/elixir-ls/release")

" Press L-`an`/`ap` to go to next/previous wrap
nnoremap <Leader>ap :ALEPreviousWrap<CR>
nnoremap <Leader>an :ALENextWrap<CR>

" Press L-`af` to manually trigger the fixer
nnoremap <Leader>af :ALEFix<CR>

" Press L-`ar` to find all references matching the word under the caret
noremap <Leader>ar :ALEFindReferences<CR>

" Press L-`ad` to go to definition
nnoremap <Leader>ad :ALEGoToDefinition<CR>

" Press `K` to view the type in the gutter
nnoremap <silent> K :ALEHover<CR>

" fixing default theme faulty ale warning highlights
highlight ALEWarning ctermbg=Red ctermfg=White
