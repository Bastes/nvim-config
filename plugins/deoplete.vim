" boots deoplete at startup
let g:deoplete#enable_at_startup = 1

" 100Mb ram is a small price to pay nowadays
let g:deoplete#tag#cache_limit_size = 100000000

" use tags as source as well as buffers
call deoplete#custom#option('sources', {
    \ '_': ['ultisnips', 'ale', 'buffer', 'tag'],
    \})

" closes the preview scratchpad after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

call deoplete#custom#option('candidate_marks', ['A', 'S', 'D', 'F', 'G'])
inoremap <expr>A pumvisible() ? deoplete#insert_candidate(0) : 'A'
inoremap <expr>S pumvisible() ? deoplete#insert_candidate(1) : 'S'
inoremap <expr>D pumvisible() ? deoplete#insert_candidate(2) : 'D'
inoremap <expr>F pumvisible() ? deoplete#insert_candidate(3) : 'F'
inoremap <expr>G pumvisible() ? deoplete#insert_candidate(4) : 'G'
