"----------------------------------
let s:cpo_save = &cpo | set cpo&vim
"----------------------------------

function plugins#vtbox#setup#before_source()
    call s:buffer_mappings()

    if ! VimrcIsCplane()
        function Vtbox_onWorkspaceConfiguration()
            nnoremap <leader>G :call vtbox#workspace#grep#current_word()<CR>
            vnoremap <leader>G :call vtbox#workspace#grep#visual_word()<CR>

            nnoremap <leader>sa :call vtbox#workspace#find#filename('*', 'unite')<CR>

            nnoremap <leader>oo :call vtbox#workspace#find#current_word()<CR>
            vnoremap <leader>oo :call vtbox#workspace#find#visual_word()<CR>
            nnoremap <leader>oS :call vtbox#workspace#find#current_word('vsplit')<CR>
            vnoremap <leader>oS :call vtbox#workspace#find#visual_word('vsplit')<CR>
            nnoremap <leader>os :call vtbox#workspace#find#current_word('split')<CR>
            vnoremap <leader>os :call vtbox#workspace#find#visual_word('split')<CR>
            nnoremap <leader>ot :call vtbox#workspace#find#current_word('tabnew')<CR>
            vnoremap <leader>ot :call vtbox#workspace#find#visual_word('tabnew')<CR>

            command! -nargs=* -complete=customlist,vtbox#workspace#find#parser#completion
                    \ FindWorkspace :call vtbox#workspace#find#parser#execute(<q-args>)

            command!  -nargs=* -complete=customlist,vtbox#workspace#grep#parser#completion
                    \ GrepWorkspace :call vtbox#workspace#grep#parser#execute(<q-args>)
        endfunction
    endif
endfunction

function s:buffer_mappings()
    augroup VtboxBuffersMappings
        autocmd!
        autocmd Filetype c,cpp silent call plugins#vtbox#setup#cpp_buffer()
        autocmd Filetype vim   command! -nargs=* -buffer
                    \ -complete=customlist,vtbox#themis#command#complete
                    \ Themis :call vtbox#themis#command#execute(<q-args>)
        autocmd Filetype plantuml command! -nargs=* -buffer
                    \ -complete=customlist,vtbox#plantuml#command#complete
                    \ PlantUml :call vtbox#plantuml#command#execute(<q-args>)
    augroup END
endfunction


function plugins#vtbox#setup#cpp_buffer()
    nnoremap <buffer> <leader>sf :call vtbox#find#cpp#flip_source()<CR>
    nnoremap <buffer> <leader>sF :call vtbox#find#cpp#flip_source('unite')<CR>
endfunction

"---------------------------------------
let &cpo = s:cpo_save | unlet s:cpo_save
"---------------------------------------
