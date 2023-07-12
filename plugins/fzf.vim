" fzf's search for files
nnoremap <Leader>o :FZF<CR>

let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git'"
