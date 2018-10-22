function! plugins#denite_gtags#setup#postSource()
    call s:gtags_mappings()
endfunction

function! s:gtags_mappings()
    nnoremap <leader>a :DeniteCursorWord -buffer-name=gtags_context gtags_context<cr>
    nnoremap <leader>d :DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
    nnoremap <leader>r :DeniteCursorWord -buffer-name=gtags_ref gtags_ref<cr>
    nnoremap <leader>g :DeniteCursorWord -buffer-name=gtags_grep gtags_grep<cr>
    nnoremap <leader>t :Denite -buffer-name=gtags_completion gtags_completion<cr>
    nnoremap <leader>f :Denite -buffer-name=gtags_file gtags_file<cr>
    nnoremap <leader>p :Denite -buffer-name=gtags_path gtags_path<cr>
endfunction
