" boots deoplete at startup
let g:deoplete#enable_at_startup = 1

" 100Mb ram is a small price to pay nowadays
let g:deoplete#tag#cache_limit_size = 100000000

" use tags as source as well as buffers
call deoplete#custom#option('sources', {
    \ '_': ['ale', 'buffer', 'tag'],
    \})

" closes the preview scratchpad after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
