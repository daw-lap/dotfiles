set encoding=UTF-8
set cindent
set cinoptions+=g0
set number
set showmatch
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

let mapleader=','

set incsearch
set hlsearch

filetype plugin indent on

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <C-space> :%s/\s\+$//e<CR>

syntax enable

autocmd BufNewFile,BufRead *.log setfiletype log
autocmd BufNewFile,BufRead *.LOG setfiletype log
autocmd BufNewFile,BufRead *.out setfiletype log

highlight ColorColumn ctermbg=red

nnoremap <space>l :set filetype=log<CR>
nnoremap <silent><Right> :bn<CR>
nnoremap <silent><Light> :bp<CR>

function! __vimrc_c_buffers()
    setlocal colorcolumn=120
endfunction

function! __vimrc_ttcn_buffers()
    setlocal colorcolumn=130
    nnoremap <buffer><F3> <C-]>
    nnoremap <buffer><F2> <C-T>
    set tags=/var/fpwork/dlapczyn/bts_sc_cplane/tags
endfunction

augroup VimrcBufferSettingsAutoCmd
    autocmd!
    autocmd Filetype cpp,c call __vimrc_c_buffers()
    autocmd Filetype ttcn call __vimrc_ttcn_buffers()
    autocmd BufNewFile,BufRead *_SCT.k3.txt set filetype=log
augroup END
