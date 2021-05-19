" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'elm': ['elm-language-server'],
    \ 'elixir': ['~/elixir-ls/release/language_server.sh']
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'elm': ['elm.json'],
    \}

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <Leader>r <Plug>(lcn-rename)


" to install the server(s):
" * elixir
"   ```sh
"     $ cd
"     $ git clone git@github.com:elixir-lsp/elixir-ls.git
"     $ cd elixir-ls
"     $ mix deps.get
"     $ mix compile
"     $ MIX_ENV=prod mix elixir_ls.release
"   ```
" * elm  # TODO
" * ruby # TODO
