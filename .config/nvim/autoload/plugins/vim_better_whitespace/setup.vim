"----------------------------------
let s:cpo_save = &cpo | set cpo&vim
"----------------------------------
function plugins#vim_better_whitespace#setup#postSource()
    call plugins#vim_better_whitespace#setup#settings()
endfunction

function plugins#vim_better_whitespace#setup#colors()
    let g:better_whitespace_ctermcolor='#FF005F'
endfunction

function plugins#vim_better_whitespace#setup#settings()
    let g:better_whitespace_enabled=1
    let g:strip_whitespace_on_save=1
endfunction
