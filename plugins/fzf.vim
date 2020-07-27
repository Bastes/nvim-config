" fzf's search for files
nmap <C-p> :FZF<CR>

let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git'"
