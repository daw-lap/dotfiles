function! plugins#unite#setup#postSource()
    call s:buffer()
    call s:gtags_path()
    autocmd Filetype unite call s:mappings()
endfunction

function! s:buffer()
    noremap <leader>b :Unite buffer<CR>
endfunction

function! s:gtags_path()
    noremap <leader>gp :Unite gtags/path<CR>
endfunction

function! s:mappings()
    nnoremap <silent><buffer><expr> t unite#smart_map('t', unite#do_action('tabopen'))
    nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    nnoremap <silent><buffer><expr> S unite#smart_map('S', unite#do_action('vsplit'))
    nnoremap <silent><buffer><expr> Q unite#smart_map('q', unite#do_action('delete'))
endfunction
