if &compatible
    set nocompatible
endif

" dein settings
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein') 
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')
    
    call dein#add('Shougo/deoplete.nvim')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    if dein#check_install()
        call dein#install()
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

" globals
let g:deoplete#enable_at_startup = 1

