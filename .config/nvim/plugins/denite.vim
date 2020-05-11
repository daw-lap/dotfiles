noremap <leader>b :Denite buffer<CR>
noremap <leader>gp :Denite gtags_path<CR>
noremap <leader>fr :Denite file/rec<CR>
nnoremap <leader>a :DeniteCursorWord -buffer-name=gtags_context gtags_context<cr>
nnoremap <leader>d :DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
nnoremap <leader>r :DeniteCursorWord -buffer-name=gtags_ref gtags_ref<cr>
nnoremap <leader>g :DeniteCursorWord -buffer-name=gtags_grep gtags_grep<cr>
nnoremap <leader>t :Denite -buffer-name=gtags_completion gtags_completion<cr>
nnoremap <leader>f :Denite -buffer-name=gtags_file gtags_file<cr>
nnoremap <leader>p :Denite -buffer-name=gtags_path gtags_path<cr>
autocmd Filetype denite call s:denite_buffer_mappings()
autocmd FileType denite-filter call s:denite_filter_mappings()

function! s:denite_buffer_mappings()
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    " nnoremap <silent><buffer><expr> o denite#do_map('open')
    nnoremap <silent><buffer><expr> d  denite#do_map('do_action', 'delete')
"    nnoremap <silent><buffer><expr> s denite#custom#kind('file', 'default_action', 'split=horizontal')
"    nnoremap <silent><buffer><expr> vs denite#do_map('do_action', 'split=vertical')
"    nnoremap <silent><buffer><expr> t denite#do_map('do_action', 'tab')
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
endfunction

function! s:denite_filter_mappings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
