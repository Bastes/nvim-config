" dirty hack ; required so that elixir's .ex files are not typecasted as
" euphoria3, whatever that is
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
