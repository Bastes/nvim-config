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

let g:ale_elixir_elixir_ls_release = expand('~/.local/share/nvim/site/pack/pckr/opt/vim-elixirls/elixir-ls/release')

" Setup for elm_ls
let g:ale_elm_ls_use_global = 1
let g:ale_elm_ls_executable = "/usr/local/bin/elm-language-server"
let g:ale_elm_ls_elm_path = "/usr/local/bin/elm"
let g:ale_elm_ls_elm_format_path = "/usr/local/bin/elm-format"
let g:ale_elm_ls_elm_test_path = "/usr/local/bin/elm-test"

" Press L-`ai` to manually trigger the fixer
nnoremap <Leader>ai :ALEFix<CR>

" Press L-`af` to find all references matching the word under the caret
noremap <Leader>af :ALEFindReferences<CR>

" Press L-`ad` to go to definition
nnoremap <Leader>ad :ALEGoToDefinition<CR>

" Press L-`ae` to see entire error message
nnoremap <Leader>ae :ALEDetail<CR>

" Press L-`arc` to rename the code element under cursor
nnoremap <Leader>arc :ALERename<CR>

" Press L-`arf` to rename the file and fix import paths
nnoremap <Leader>arf :ALEFileRename<CR>

" Press L-`ah` to view documentation
nnoremap <Leader>ah :ALEHover<CR>

" fixing default theme faulty ale warning highlights
highlight ALEWarning ctermbg=Red ctermfg=White
