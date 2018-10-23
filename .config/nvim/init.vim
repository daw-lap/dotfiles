if &compatible
    set nocompatible
endif

" dein settings
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein') 
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')

    " completing words
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/denite.nvim',
                \{
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#denite#setup#postSource()'
                \})
    call dein#add('ozelentok/denite-gtags',
                \{
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#denite_gtags#setup#postSource()'
                \})

    "file manager
    call dein#add('Shougo/defx.nvim',
                \{
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#defx#setup#postSource()',
                \})

    "commentary
    call dein#add('tpope/vim-commentary')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    if dein#check_install()
        call dein#install()
        call dein#update()
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

set tabstop=4
set shiftwidth=4
set expandtab
set number

nnoremap <silent> <Right> :bn <CR>
nnoremap <silent> <Left> :bp <CR>

let mapleader=','

" globals
let g:deoplete#enable_at_startup = 1

