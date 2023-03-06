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

" Setup for elm_ls
let g:ale_elm_ls_use_global = 1
let g:ale_elm_ls_executable = "/usr/local/bin/elm-language-server"
let g:ale_elm_ls_elm_path = "/usr/local/bin/elm"
let g:ale_elm_ls_elm_format_path = "/usr/local/bin/elm-format"
let g:ale_elm_ls_elm_test_path = "/usr/local/bin/elm-test"

" Press L-`an`/`ap` to go to next/previous wrap
nnoremap <Leader>ap :ALEPreviousWrap<CR>
nnoremap <Leader>an :ALENextWrap<CR>

" Press L-`af` to manually trigger the fixer
nnoremap <Leader>af :ALEFix<CR>

" Press L-`f` to find all references matching the word under the caret
noremap <Leader>f :ALEFindReferences<CR>

" Press L-`d` to go to definition
nnoremap <Leader>d :ALEGoToDefinition<CR>

" Press L-`rc` to rename the code element under cursor
nnoremap <Leader>rc :ALERename<CR>

" Press L-`rf` to rename the file and fix import paths
nnoremap <Leader>rf :ALEFileRename<CR>

" Press L-`ah` to view documentation
nnoremap <Leader>ah :ALEHover<CR>

" fixing default theme faulty ale warning highlights
highlight ALEWarning ctermbg=Red ctermfg=White
