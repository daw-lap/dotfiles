"----------------------------------
let s:cpo_save = &cpo | set cpo&vim
"----------------------------------

function! plugins#vimFiler#setup#before_source()
    let g:vimfiler_no_default_key_mappings = 1
endfunction

function plugins#vimFiler#setup#after_source()
    call s:settings()

    nnoremap <leader>N :VimFilerCurrentDir<CR>
    nnoremap <leader>T :VimFilerBufferDir -find<CR>

    augroup VimrcVimFilerAutoCmd
        autocmd!
        autocmd Filetype vimfiler call plugins#vimFiler#setup#buffer_mappings()
    augroup END
endfunction

function s:settings()
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_ignore_pattern = ['^\.']

    let g:vimfiler_data_directory = VimrcGetCachePath().'/vimFiler'

    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '▾'
    let g:vimfiler_tree_closed_icon = '▸'
    let g:vimfiler_file_icon = '-'
    let g:vimfiler_marked_file_icon = '*'

    call vimfiler#custom#profile('default', 'context', {
        \ 'safe' : 0,
        \ 'edit_action' : 'open',
        \ 'sort-type=' : 'filename',
        \ })

endfunction

function plugins#vimFiler#setup#buffer_mappings()
    nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
    nmap <buffer> h <Plug>(vimfiler_smart_h)
    nmap <buffer> l <Plug>(vimfiler_expand_or_edit)

    nmap <buffer> o <Plug>(vimfiler_cd_or_edit)

    nmap <buffer> ~ <Plug>(vimfiler_switch_to_home_directory)
    nmap <buffer> \ <Plug>(vimfiler_switch_to_root_directory)
    nmap <buffer> & <Plug>(vimfiler_switch_to_project_directory)

    nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> C <Plug>(vimfiler_clear_mark_all_lines)
    nmap <buffer> X <Plug>(vimfiler_toggle_mark_all_lines)

    nmap <buffer> <leader>r <Plug>(vimfiler_redraw_screen)
    nmap <buffer> <leader>s <Plug>(vimfiler_popup_shell)
    nmap <buffer> <leader>S <Plug>(vimfiler_select_sort_type)
    nmap <buffer> za <Plug>(vimfiler_toggle_visible_ignore_files)
    nmap <buffer> <leader>p <Plug>(vimfiler_preview_file)

    nmap <buffer> <Tab> <Plug>(vimfiler_choose_action)

    nnoremap <silent><buffer><expr> S vimfiler#do_switch_action('vsplit')
    nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('split')

    nmap <buffer> dd <Plug>(vimfiler_delete_file)
    nmap <buffer> yy <Plug>(vimfiler_yank_full_path)
    nmap <buffer> mf <Plug>(vimfiler_new_file)
    nmap <buffer> md <Plug>(vimfiler_make_directory)
    nmap <buffer> rf <Plug>(vimfiler_rename_file)
    nmap <buffer> rd <Plug>(vimfiler_rename_file)

    nmap <buffer> <leader>? <Plug>(vimfiler_help)

    nmap <buffer> q <Plug>(vimfiler_close)
endfunction

"---------------------------------------
let &cpo = s:cpo_save | unlet s:cpo_save
"---------------------------------------
