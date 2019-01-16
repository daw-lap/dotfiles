function! plugins#vim_ttcn#setup#postSource()
    call s:naming_convention()
endfunction

function! s:naming_convention()
    let g:ttcn_hl_naming_convention_my = 1
    let g:ttcn_fold = 1
endfunction
