if &compatible
    set nocompatible
endif

let mapleader=','

"##### FUNCTIONS #####
function! IsKrling()
    return match(hostname(), 'krling') != -1
endfunction

function! VimrcIsCplane()
    return filereadable('./.config_fsmr3') && isdirectory('./C_Application')
endfunction

"##### shougo/dein plugin manager #####
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein') 
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')

    " completing words
    call dein#add('Shougo/deoplete.nvim')

    call dein#add('Shougo/unite.vim',
                \{
                \'name':'unite',
                \'if':'IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#unite#setup#postSource()'
                \})
    call dein#add('hewes/unite-gtags',
                \{
                \'if':'IsKrling()',
                \'on_event':'VimEnter',
                \'on_ft':["cpp", "c"],
                \'hook_post_source':'call plugins#unite_gtags#setup#postSource()'
                \})
    call dein#add('Shougo/denite.nvim',
                \{
                \'if':'!IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#denite#setup#postSource()'
                \})
    call dein#add('ozelentok/denite-gtags',
                \{
                \'if':'!IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#denite_gtags#setup#postSource()'
                \})
    call dein#add('matfranczyk/vtbox.vim',
                \{
                \'name':'vtbox',
                \'if':'IsKrling()',
                \'depends':'unite',
                \'on_event':'VimEnter',
                \'hook_source':'call plugins#vtbox#setup#before_source()'
                \})
    call dein#add('matfranczyk/highlighter.vim')
    "unite - gtags fork of matfranczy
    call dein#add('https://gitlab.com/matfranczy/gtags.vim',
                \{ 'if':'VimrcIsCplane()' })
    call dein#add('https://gitlab.dynamic.nsn-net.net/mfranczy/cplane.vim.git',
                \{
                \'if':'VimrcIsCplane()',
                \'name':'cplane',
                \'depends':['unite', 'vtbox'],
                \
                \'on_event':'VimEnter',
                \'hook_source':'call plugins#cplane#setup#post_source()',
                \
                \'make':'git submodule update --recursive'
                \})

    "commentary
    call dein#add('tpope/vim-commentary')

    "enhanced cpp highlighting
    call dein#add('bfrg/vim-cpp-modern')

    call dein#add('Shougo/defx.nvim',
                \{
                \'if':'!IsKrling()',
                \'on_event':'VimEnter',
                \'hook_post_source':'call plugins#defx#setup#postSource()',
                \})

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    if dein#check_install()
        call dein#update()
        call dein#install()
    endif

    call dein#end()
    call dein#save_state()
endif


syntax enable

"spaces and tabs
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in tab when editing
set shiftwidth=4
set expandtab "tabs are spaces

"user interface
set number "show line numbers

filetype plugin indent on "load filetype-specific indent files
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when we need to
set showmatch "highlight matching [{()}]

"searching
set incsearch "search as characters entered
set hlsearch "highlight matches
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <silent> <Right> :bn <CR>
nnoremap <silent> <Left> :bp <CR>

nnoremap <silent> <C-w>> :10winc > <CR>
nnoremap <silent> <C-w>< :10winc < <CR>


" globals
let g:deoplete#enable_at_startup = 1

