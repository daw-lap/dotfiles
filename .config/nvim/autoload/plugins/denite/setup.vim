function! plugins#denite#setup#postSource()
    call s:show_buffer()
endfunction

function! s:show_buffer()
    noremap <leader>b :Denite buffer<CR>
endfunction
