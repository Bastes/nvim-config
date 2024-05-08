" fzf's search for files under Leader-o
nnoremap <Leader>o :FZF<CR>

let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git'"
