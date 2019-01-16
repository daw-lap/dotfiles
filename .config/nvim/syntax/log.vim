if exists("b:current_syntax")
  finish
endif

syn match log_error         '[A-Za-z0-9_./]*ERR[A-Za-z0-9_./]*'
syn match log_error         '[A-Za-z0-9_./]*FAIL[A-Za-z0-9_./]*'
syn match log_error         '[A-Za-z0-9_./]*FATAL[A-Za-z0-9_./]*'

syn match log_warning       '[A-Za-z0-9_./]*WARN[A-Za-z0-9_./]*'
syn match log_warning       '[A-Za-z0-9_./]*WRN[A-Za-z0-9_./]*'

syn match log_debug         '[A-Za-z0-9_./]*DBG[A-Za-z0-9_./]*'
syn match log_debug         '[A-Za-z0-9_./]*DEBUG[A-Za-z0-9_./]*'

syn match log_info          '[A-Za-z0-9_./]*INF[A-Za-z0-9_./]*'

syn match log_number        '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'

syn match log_func_call     '[_A-Za-z0-9]*()'

syn region log_string       start=/'/ end=/'/ end=/$/ skip=/\\./
syn region log_string       start=/"/ end=/"/ skip=/\\./

syn match   log_date        '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9 ]\d *'
syn match   log_date        '\d\d\d\d-\d\d-\d\d'
syn match   log_time        '\d\d:\d\d:\d\d\s*'
syn match   log_time        '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'

hi def link log_string      String
hi def link log_number      Number
hi def link log_date        String
hi def link log_time        Type
hi def link log_info        Identifier
hi def link log_debug       Constant
hi def link log_error       ErrorMsg
hi def link log_warning     WarningMsg
hi def link log_func_call   Statement

let b:current_syntax = "log"

