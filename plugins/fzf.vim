" fzf's search for files under Leader-o
nnoremap <Leader>o :FZF<CR>

let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git'"

" allows for picking directories in the nvim command line
" use Ctrl-x Ctrl-d Esc when you want to pick a directory there
function! s:append_dir_with_fzf(line)
  call fzf#run(fzf#wrap({
    \ 'options': ['--prompt', a:line.'> '],
    \ 'source': 'git ls-files $(git rev-parse --show-toplevel) | xargs -n 1 dirname | uniq',
    \ 'sink': {line -> feedkeys("\<esc>:".a:line.line, 'n')}}))
  return ''
endfunction

cnoremap <expr> <c-x><c-d> <sid>append_dir_with_fzf(getcmdline())

" [] shortcuts to navigate the quickfix list
nnoremap [f :cn<CR>
nnoremap ]f :cp<CR>
