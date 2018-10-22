function! plugins#denite#setup#postSource()
    call s:buffer()
endfunction

function! s:buffer()
    noremap <leader>b :Denite buffer<CR>
endfunction
