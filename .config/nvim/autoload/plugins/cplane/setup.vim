"----------------------------------
let s:cpo_save = &cpo | set cpo&vim
"----------------------------------
"
" api
"
function plugins#cplane#setup#post_source()
    command! CplaneGenSack : call cplane#gen_sack()

    command! -nargs=* -complete=customlist,cplane#cpp#make#parser#completion
            \ CplaneMake :call cplane#cpp#make#parser#execute(<q-args>)

    augroup VimrcCplaneBuffersMapping
        autocmd!
        autocmd Filetype c,cpp call plugins#cplane#setup#cpp_buffer()
        autocmd Filetype ttcn  call plugins#cplane#setup#ttcn_buffer()
    augroup END
endfunction

"
" mappings
"
function plugins#cplane#setup#cpp_buffer()
    nnoremap <buffer> <F4> :call cplane#cpp#gtags#retag_code()<CR>
    nnoremap <buffer> <F3> :call cplane#cpp#gtags#retag_code_uts()<CR>

    nnoremap <buffer> <F5> :call cplane#cpp#make#compile_last_target()<CR>

    nnoremap <buffer> <leader>G :call cplane#cpp#grep#current_word()<CR>
    vnoremap <buffer> <leader>G :call cplane#cpp#grep#visual_word()<CR>
endfunction


function plugins#cplane#setup#ttcn_buffer()
    nnoremap <buffer> <F3> <C-]>
    nnoremap <buffer> <F2> <C-T>
    nnoremap <buffer> <F4>          :call cplane#sct#ctags#retag()<CR>

    nnoremap <buffer> <F5>          :call cplane#sct#testcase#fast_compilation()<CR>
    nnoremap <buffer> <leader><F5>  :call cplane#sct#testcase#full_compilation()<CR>

    nnoremap <buffer> <F6>          :call cplane#sct#testcase#run_fsmr3()<CR>
    nnoremap <buffer> <leader><F6>  :call cplane#sct#testcase#run()<CR>

    nnoremap <buffer> <leader>G :call cplane#sct#grep#current_word()<CR>
    vnoremap <buffer> <leader>G :call cplane#sct#grep#visual_word()<CR>
endfunction

"---------------------------------------
let &cpo = s:cpo_save | unlet s:cpo_save
"---------------------------------------
