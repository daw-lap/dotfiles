function! plugins#gitgutter#setup#postSource()
    call s:gitgutter_signColumn()
    call s:gitgutter_signColors()
endfunction

function! s:gitgutter_signColumn()
    if exists('&signcolumn')
        set signcolumn=yes
    else
        let g:gitgutter_sign_column_always = 1
    endif
endfunction

function! s:gitgutter_signColors()
    highlight clear SignColumn
    highlight link GitGutterAdd DiffAdd
    highlight link GitGutterChange DiffChange
    highlight link GitGutterDelete DiffDelete
    highlight link GitGutterChangeDelete DiffChangeDelete
endfunction
