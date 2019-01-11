function! plugins#unite_gtags#setup#postSource()
    call s:gtags_mappings()
endfunction

function! s:gtags_mappings()
    " if 'krling166.emea.nsn-net.net' == hostname()
    noremap <leader>t :Unite gtags/context<CR>
    noremap <leader>d :Unite gtags/def<CR>
    noremap <leader>r :Unite gtags/ref<CR>
    " endif
endfunction

