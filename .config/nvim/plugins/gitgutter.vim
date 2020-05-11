if exists('&signcolumn')
    set signcolumn=yes
else
    let g:gitgutter_sign_column_always = 1
endif

highlight clear SignColumn
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete DiffChangeDelete
