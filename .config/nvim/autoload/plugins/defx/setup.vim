function! plugins#defx#setup#postSource()
    nnoremap <leader>N :Defx<CR>
    autocmd Filetype defx call s:defx_my_mappings()
endfunction

function! s:defx_my_mappings()
    nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
    nnoremap <silent><buffer><expr> l defx#do_action('open')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
endfunction
