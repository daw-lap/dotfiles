function! plugins#denite#setup#postSource()
    call s:show_buffer()
    call s:gtags_path()
endfunction

function! s:show_buffer()
    noremap <leader>b :Denite buffer<CR>
endfunction

function! s:gtags_path()
    noremap <leader>gp :Denite gtags_path<CR>
endfunction

