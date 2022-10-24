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
\  'elixir': 'mix_format',
\  'elm': 'elm-format',
\  'javascript': 'eslint',
\  'python': 'autopep8',
\  'ruby': 'rubocop'
\}

let g:ale_linters = {
\  'elixir': ['elixir-ls'],
\  'elm': 'elm_ls',
\  'python': ['autopep8', 'pylint', 'pylsp'],
\  'ruby': 'solargraph'
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

" Press L-`af` to find all references matching the word under the caret
noremap <Leader>af :ALEFindReferences<CR>

" Press L-`ad` to go to definition
nnoremap <Leader>ad :ALEGoToDefinition<CR>

" Press L-`ar` to rename the element under cursor
nnoremap <Leader>ar :ALERename<CR>

" Press L-`aR` to rename the file and fix import paths
nnoremap <Leader>aR :ALEFileRename<CR>

" Press L-`ah` to view documentation
nnoremap <Leader>ah :ALEHover<CR>

" fixing default theme faulty ale warning highlights
highlight ALEWarning ctermbg=Red ctermfg=White
